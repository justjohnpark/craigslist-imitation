get '/articles' do
  @articles = Article.all.order("updated_at DESC")
  erb :"articles/index"
end

get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  editor_key = params[:editor_key]

  if @article.editor_key == editor_key
    erb :"articles/edit"
  else
    redirect to("/articles/#{params[:id]}")
  end
end

put '/articles/:id' do
  article = Article.find(params[:id])
  article.update_attributes(params[:article])

  redirect to("/articles/#{params[:id]}")
end

# delete '/articles/:id' do
get '/articles/:id/delete' do
  article = Article.find(params[:id])
  article.destroy
  redirect to("/articles")
end

get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :"articles/show"
end


