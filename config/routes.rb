Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
