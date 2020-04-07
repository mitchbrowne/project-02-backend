Rails.application.routes.draw do
  # get 'histories/index'
  # get 'histories/show'
  # get 'histories/edit'
  # get 'histories/new'

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
  get '/requests/galleries' => 'requests#galleries'
  get '/requests/galleries/:id' => 'requests#galleries_show'
  get '/requests/histories/:id' => 'requests#histories_show'
  post '/requests/histories/:id' => 'requests#histories_update'
  get '/requests/companies' => 'requests#companies'
end
