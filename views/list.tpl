% rebase('base.tpl', title='The blog of Abraham Williams')

<div id="posts" class="row masonry">
% for post in posts:
    % include('post_list.tpl', post=post)
% end
</div>