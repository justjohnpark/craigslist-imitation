ALPHABET = ('a'..'z').to_a
NUMBERS = (1..9).to_a

get '/categories' do
  @categories = Category.all.order("updated_at DESC")
  erb :"categories/index"
end

get '/categories/:id/articles' do
  @category = Category.find(params[:id])
  @articles = @category.articles.order("updated_at DESC")

  erb :"categories/show"
end


get '/categories/:id/articles/new' do
  @category = Category.find(params[:id])
  @articles = @category.articles.order("updated_at DESC")
  @article = Article.new
  erb :"categories/show"
end

post '/categories/:id/articles/new' do
  category = Category.find(params[:id])
  article_info = params[:article]
  article_info[:editor_key] = ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s
  category.articles << Article.new(params[:article])

  redirect to("/categories/#{params[:id]}/articles")
end
