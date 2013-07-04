post '/' do
  unless params[:username] == ""
  @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/"
    else
      @post = Post.find(:all, :order => "created_at desc", :limit => 20)
      @login_errors = "Sorry, we couldn't find that username/password combination."
      erb :index
    end
  else
    @post = Post.find(:all, :order => "created_at desc", :limit => 20)
    @login_errors = "Sorry, we couldn't find that username/password combination."
    erb :index 
  end
end

post '/register' do
  @user = User.create( { username: params[:username], password_hash: params[:password] } )

  if @user.errors.any?
    @post = Post.find(:all, :order => "created_at desc", :limit => 20)
    @registration_errors = @user.errors.full_messages
    erb :index
  else
    session[:user_id] = @user.id
    redirect "/"
  end
end

get '/logout' do
  session.clear
  redirect "/"
end

get '/user/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts.find(:all, :order => "created_at desc", :limit => 5 )
  @comments = @user.comments.find(:all, :order => "created_at desc", :limit => 5 )
  erb :user_profile
end
