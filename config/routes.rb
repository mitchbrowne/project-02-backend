Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :index]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :ads
  resources :galleries
  resources :companies
  resources :histories

  get '/requests/ads' => 'requests#ads'
  get '/requests/ads/:id' => 'requests#ads_show'
  get '/requests/galleries/user/:id' => 'requests#user_galleries'
  get '/requests/galleries' => 'requests#galleries'
  get '/requests/galleries/:id/:user_id' => 'requests#galleries_show'
  get '/requests/histories/:id' => 'requests#histories_show'
  post '/requests/histories/:id' => 'requests#histories_update'
  get '/requests/companies/:id' => 'requests#companies_show'
end
