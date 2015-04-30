% rebase('base.tpl', title='The blog of Abraham Williams', sidebar=sidebar)

<div class="container">
    <div id="posts" class="row masonry">
    % for post in posts:
        % include('post_list.tpl', post=post)
    % end

    % if not posts:
        <div class="valign-wrapper nothing center center-align">
            <h5 class="valign center-align">No posts found :-/</h5>
        </div>
    % end
    </div>
</div>
