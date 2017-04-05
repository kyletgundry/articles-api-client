class ArticlesController < ApplicationController
  def index
    @articles = Unirest.get("http://localhost:3000/api/v1/articles").body
    render "index.html.erb"
  end

  

  def show
    @article = Unirest.get("http://localhost:3000/api/v1/articles/#{params[:id]}").body
    render "show.html.erb"
  end

end
