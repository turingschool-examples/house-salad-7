Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get "/search", to: "search#index"

  namespace :api do
    namespace :v1 do
      get "/state-search", to: "search#index"
      get "/name-search", to: "search#show"
    end
  end
end
