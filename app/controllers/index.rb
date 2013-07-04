get '/' do
  @post = Post.find(:all, :order => "created_at desc", :limit => 20)

  if session[:user_id]
    @user = User.find(session[:user_id]) 
  end

  erb :index
end

