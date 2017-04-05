Rails.application.routes.draw do
  get "/articles" => "articles#index"
  get "/articles/new" => "articles#new"
  post "/articles" => "articles#create"
  get "/articles/:id" => "articles#show"

end
