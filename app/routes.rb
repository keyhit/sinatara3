# show all posts and users
get '/' do 
  @title = 'Head page'
  @posts = Post.all
  @users = User.all
  erb :index
end

# posts data operations
# call show one post by user id
get '/users/:user_id/posts/:id' do 
  @user = User.find(params[:user_id])
  @post = @user.posts.find(params[:id])
  @title = @post.title
  @content = @post.content
  erb :'posts/show'
end

# call all posts of user
get '/users/:user_id/posts' do 
  @title = 'All user\'s posts'
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :'posts/index'
end

# call creation posts form
get '/posts/:user_id/new' do 
  @title = 'New post'
  @user = params[:user_id]
  erb :'posts/new'
end

# exec creation new post
post '/posts' do 
  params.delete 'submit'
  @posts = Post.create(params)
  if @posts.save
    @user = params[:user_id]
    redirect to "/users/#{@user}/posts"
  else
    'Post was no save'
  end
end

#call edit form 
get '/user/:user_id/post/:id/edit' do 
  @title = 'You edit now'
  @post = Post.find(params[:id])
  @user = User.find(params[:user_id])
  erb :'posts/edit'
end

# exec editing posts
put '/user/:user_id/post/:id' do 
  @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect to "/users/#{params[:user_id]}/posts"
    else
      erb :'posts/edit'
    end
end

# call confirmation for delete post
get '/user/:user_id/post/:post_id/delete' do 
  @title = 'Delete post'
  @user = User.find(params[:user_id])
  @post = Post.find(params[:post_id])
erb :'posts/form_delete_confirm'
end

# exec deletion post selected by id
delete '/user/:user_id/post/:id' do 
  Post.find(params[:id]).destroy
  redirect to "/users/#{params[:user_id]}/posts"
end

# users data operations
# call creation users form
get '/user/new' do 
  @title = 'User creation'
  erb :'users/new'
end

# exec creation new user
post '/users' do 
  params.delete 'submit'

  User.where(name: "root").each do |f|
  @root_check = f.name
  end

  if params[:name] == @root_check
    'Must be only one "root"! 
    Press "Back" on your web browser'
  else
    @users = User.create(name: params[:name])
      if @users.save
        redirect to "/"
      else
        'Username was no save'
      end
    end
 
end

#overwiew all about user 
get '/users/:id' do 
  @user = User.find(params[:id])
  @title = "#{@user.name}'s page"
  erb :'users/index'
end

#call edit user form 
get '/users/:id/edit' do 
  @user = User.find(params[:id])
  erb :'users/edit'
end

# exec editing username
put '/users/:id' do 
  @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      @uid = params[:id]
      redirect to "/users/#{@uid}"
    else
      erb :'users/edit'
    end
end

# call confirmation for delete user
get '/users/:id/delete' do 
  @title = 'Delete user'
  @user = params[:id]
erb :'users/form_delete_confirm'
end

# exec deletion post selectes by id
delete '/users/:id' do 
  User.find(params[:id]).destroy
  redirect to '/'
end

get '/data_json' do 
  content_type :json
  @posts = Post.all
  @posts.to_json
end

get '/responds' do 
@posts = Post.all
  def show
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
end
