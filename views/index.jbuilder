json.posts @posts do |post|
  json.title post.title
  json.content post.content
  json.created_at post.created_at
  json.user_name post.user.name
end

json.users @users do |user|
  json.name user.name
end
