require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles/"
  end

end


  # get '/' do
  #   redirect to '/articles'
  # end
  
  # get '/articles' do
  #   @article = Article.all
  #   erb :index
  # end
  
  # get '/articles/new' do
  #   @article = Article.new
  #   erb :new
  # end
  
  # post '/articles' do
  #   @article = Article.create(params)
  #   redirect to 'articles/#{@article.id}'
  # end
  
  # get '/articles/:id' do
  #   @article = Article.find(params[:id])
  #   erb :show
  # end
  
  # get '/articles/:id/edit' do
  #   @article = Article.find(params[:id])
  #   erb :edit
  # end
  
  # patch '/articles/:id' do
  #   @article = Article.find(params[:id])
  #   @article.update(params)
  #   redirect to '/articles/#{@articles.id}'
  # end
  
  # delete '/articles/:id' do
  #   Article.destroy(params[id])
  #   redirect to '/articles'
  # end
  