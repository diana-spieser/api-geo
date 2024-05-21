Rails.application.routes.draw do
  get 'geo_api/index'

post 'geo_api/index' => 'geo_api#index', as: :submit_geo_api

 root 'users#new'
resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
