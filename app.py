import os
from bottle import get, run, template, view, request, response
from apiclient.discovery import build
from bs4 import BeautifulSoup
from momentpy import from_now
from datetime import datetime


DEBUG = os.environ['DEBUG'] == 'True'
HOST = os.environ['HOST']
PORT = os.environ['PORT']
BLOG_ID = os.environ['BLOG_ID']
API_KEY = os.environ['API_KEY']
OLD_BLOG_URL = os.environ['OLD_BLOG_URL']
NEW_BLOG_URL = os.environ['NEW_BLOG_URL']
MAX_RESULTS_COUNT = os.environ['MAX_RESULTS_COUNT']


# TODO
# Get blog info on start


def mutate_post(post):
    post['url'] = update_blog_link(post['url'])
    post['content'], post['img'] = find_image(post['content'])
    post['summary'] = find_summary(post['content'])
    post['from_now'] = from_now_date(post['published'])
    post['content'] = wrap_frames(post['content'])


def from_now_date(published):
    return from_now(datetime.strptime(published[:-6], '%Y-%m-%dT%H:%M:%S'))


def find_summary(content):
    soup = BeautifulSoup(content)
    for string in soup.stripped_strings:
        if len(string) > 10:
            return string


def wrap_frames(content):
    soup = BeautifulSoup(content)
    for frame in soup.find_all('iframe'):
        frame = frame.wrap(soup.new_tag("div"))
        frame['class'] = "video-container"
    return str(soup)


def find_image(content):
    image = False
    soup = BeautifulSoup(content)
    for img in soup.find_all('img'):
        if not image:
            image = {
                'url': img.get('src')
            }
        del img['width']
        del img['height']
        img['class'] = "responsive-img"
    return (str(soup), image)


def update_blog_link(url):
    return url.replace(OLD_BLOG_URL, NEW_BLOG_URL)


def list_posts(label=None):
    service = build('blogger', 'v3', developerKey=API_KEY)
    options = {
        'blogId': BLOG_ID,
        'maxResults': MAX_RESULTS_COUNT,
    }
    if label:
        options['labels'] = label
    result = service.posts().list(**options).execute()
    for post in result.get('items', []):
        mutate_post(post)
    return result


def build_sidebar_links(posts):
    existing = []
    links = []
    for post in posts:
        build_label(existing, links, post)
    return sort_sidebar_links(links)


def build_sidebar_links_post(post):
    existing = []
    links = []
    build_label(existing, links, post)
    return sort_sidebar_links(links)


def build_label(existing, links, post):
    for label in post.get('labels', []):
        label = label.lower()
        if label not in existing:
            existing.append(label)
            links.append({
                'text': '#' + label,
                'href': '/search/label/' + label,
            })


def sort_sidebar_links(links):
    return sorted(links, key=lambda k: k['text'])


def get_post(path):
    service = build('blogger', 'v3', developerKey=API_KEY)
    post = service.posts().getByPath(blogId=BLOG_ID, path=path).execute()
    mutate_post(post)
    return post


@get('/')
def index():
    result = list_posts()
    posts = result.get('items', [])
    sidebar = build_sidebar_links(posts=posts)
    return template('list.tpl', posts=posts, sidebar=sidebar)


@get('/robots.txt')
def index():
    response.content_type = 'text/plain'
    robot = """User-agent: *
Disallow: /
    """
    return robot


@get('/search/label/<label>')
def index(label):
    result = list_posts(label=label)
    posts = result.get('items', [])
    sidebar = build_sidebar_links(posts=posts)
    return template('list.tpl', posts=posts, sidebar=sidebar)


@get('/<year>/<month>/<title>')
def post(year, month, title):
    result = get_post(request.path)
    sidebar = build_sidebar_links_post(post=result)
    return template('post_get.tpl', post=result, sidebar=sidebar)


run(host=HOST, port=PORT, debug=DEBUG, reloader=DEBUG)
