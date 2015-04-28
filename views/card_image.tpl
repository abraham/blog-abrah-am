<div class="card">
    <div class="card-image">
        <img src="{{post['img']['url']}}">
        <span class="card-title"><a href="{{post['url']}}" class="white-text">{{post['title']}}</a></span>
    </div>
    % if post['summary']:
        <div class="card-content">
            <p>{{post['summary']}}</p>
        </div>
    % end
</div>
