get '/post/:post_id' do
  @post = Post.find(params[:post_id])

  erb :post
end

post '/create_post' do
  @post = Post.create( { title: params[:title],
                         user_id: session[:user_id],
                         url_link: params[:url_link] } )

  redirect "/post/#{@post.id}"
end
