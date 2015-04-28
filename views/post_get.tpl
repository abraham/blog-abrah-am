% rebase('base.tpl', title=post['title'])
<div class="row">
    <div class="post col s8 m8 l8 offset-s2 offset-m2 offset-l2" data-url="{{post['url']}}">
        <h2 class="header">{{post['title']}}</h2>
        <div>
            % for label in post.get('labels', []):
                <a href="#!" class="waves-effect waves-teal btn-flat">#{{label}}</a>
            % end
            {{post['from_now']}}
            <div class='post-gplus right'><div class="g-plusone" data-annotation="inline" data-width="300" data-href="http://gogole.com"></div></div>
        </div>
        <br>
        <div>
            {{!post['content']}}
        </div>
    </div>
</div>
