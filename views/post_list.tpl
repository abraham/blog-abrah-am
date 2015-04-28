<div class="post col s12 m6 l3" data-url="{{post['url']}}">
    % if post['img']:
        % include('card_image.tpl', post=post)
    % else:
        % include('card_content.tpl', post=post)
    % end
</div>
