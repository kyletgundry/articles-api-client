class ArticlesController < ApplicationController
  def index
    @articles = Unirest.get("http://localhost:3000/api/v1/articles").body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @article = Article.create(
      title: params[:title],
      author: params[:author],
      image: params[:image],
      date: params[:date],
      description: params[:description]
      )
    redirect_to "/articles"
  end

  def show
    @article = Unirest.get("http://localhost:3000/api/v1/articles/#{params[:id]}").body
    render "show.html.erb"
  end

end
