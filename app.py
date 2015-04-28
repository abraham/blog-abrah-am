import os
from bottle import get, run, template, view, request
from apiclient.discovery import build
from bs4 import BeautifulSoup
from momentpy import from_now
from datetime import datetime


DEBUG = os.environ['DEBUG']
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


def from_now_date(published):
    return from_now(datetime.strptime(published[:-6], '%Y-%m-%dT%H:%M:%S'))


def find_summary(content):
    soup = BeautifulSoup(content)
    for string in soup.stripped_strings:
        if len(string) > 10:
            return string


def find_image(content):
    image = False
    soup = BeautifulSoup(content)
    for img in soup.find_all('img'):
        if img.get('width', 0) > 300:
            image = {
                'url': img.get('src'),
                'width': img.get('width'),
                'height': img.get('height'),
            }
        del img['width']
        del img['height']
        img['class'] = "responsive-img"
    return (str(soup), image)


def update_blog_link(url):
    return url.replace(OLD_BLOG_URL, NEW_BLOG_URL)


def list_posts():
    service = build('blogger', 'v3', developerKey=API_KEY)
    result = service.posts().list(blogId=BLOG_ID, maxResults=50).execute()
    for post in result.get('items', []):
        mutate_post(post)
    return result


def get_post(path):
    service = build('blogger', 'v3', developerKey=API_KEY)
    post = service.posts().getByPath(blogId=BLOG_ID, path=path).execute()
    mutate_post(post)
    return post


@get('/')
def index():
    result = list_posts()
    posts = result.get('items', [])
    return template('list.tpl', posts=posts)


@get('/<year>/<month>/<title>')
def post(year, month, title):
    result = get_post(request.path)
    return template('post_get.tpl', post=result)


run(host=HOST, port=PORT, debug=DEBUG, reloader=DEBUG)