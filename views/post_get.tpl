% rebase('base.tpl', title=post['title'])

<div>
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
                <span class="hide-on-med-and-down">
                    <a href="/search/label/{{label}}" class="waves-effect waves-teal btn-flat">#{{label}}</a>
                </span>
                % end
                <a href="{{post['url']}}" class="waves-effect waves-teal btn-flat">{{post['from_now']}}</a>
                
                <div class='post-gplus right'><div class="g-plusone" data-annotation="inline" data-width="250"></div></div>
            </div>
            <br>
            <div>
                {{!post['content']}}
            </div>
        </div>
    </div>
</div>
