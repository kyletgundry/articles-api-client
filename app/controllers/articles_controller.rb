class ArticlesController < ApplicationController
  def index
    @articles = Unirest.get("http://localhost:3000/api/v1/articles").body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @article = Unirest.post(
      "http://localhost:3000/api/v1/articles", 
      parameters: {
        title: params["title"], 
        author: params["author"], 
        image: params["image"], 
        date: params["date"], 
        description: params["description"]
        }
      ).body
    redirect_to "/articles/#{@article["id"]}"
  end

  def show
    @article = Unirest.get("http://localhost:3000/api/v1/articles/#{params[:id]}").body
    render "show.html.erb"
  end

  def edit
    @article = Unirest.get("http://localhost:3000/api/v1/articles/#{params[:id]}").body
    render "edit.html.erb"
  end

  def update
    @article = Unirest.patch(
      "http://localhost:3000/api/v1/articles/#{params[:id]}", 
      parameters: {
        title: params["title"], 
        author: params["author"], 
        image: params["image"], 
        date: params["date"], 
        description: params["description"]
        }
      ).body
    redirect_to "/articles/#{@article["id"]}"
  end

  def destroy
    @article = Unirest.delete("http://localhost:3000/api/v1/articles/#{params[:id]}").body
    redirect_to "/articles"
  end
end
