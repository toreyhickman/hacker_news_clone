post '/post_comment/:post_id' do
  Comment.create( { post_id: params[:post_id],
                    user_id: session[:user_id],
                    body:    params[:body] } )

  redirect "/post/#{params[:post_id]}"
end

