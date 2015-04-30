% rebase('base.tpl', title=post['title'])
% if post['img']:
<div class="parallax-container">
    <div class="parallax"><img src="{{post['img']['url']}}"></div>
</div>
% end

<div class="row white">
    <div class="post col s8 m8 l8 offset-s2 offset-m2 offset-l2" data-url="{{post['url']}}">
        <h2 class="header">{{post['title']}}</h2>
        <div>
            % for label in post.get('labels', []):
                <a href="#!" class="waves-effect waves-teal btn-flat">#{{label}}</a>
            % end
            {{post['from_now']}}
            <div class='post-gplus right'><div class="g-plusone" data-annotation="inline" data-width="250"></div></div>
        </div>
        <br>
        <div>
            {{!post['content']}}
        </div>
    </div>
</div>
