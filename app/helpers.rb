def show_user_post(user_id, post_id)
  "/users/#{user_id}/posts/#{post_id}"
end

def user_posts(user_id)
  "/users/#{user_id}/posts"
end

def new_post_form(user_id)
  "/posts/#{user_id}/new"
end

def new_post_writer
  "/posts"
end

def call_del_confirm(user_id, post_id)
  "/user/#{user_id}/post/#{post_id}/delete"
end