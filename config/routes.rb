Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :index]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :ads
  resources :galleries
  resources :companies

  get '/requests/ads' => 'requests#ads'
  get '/requests/galleries' => 'requests#galleries'
  get '/requests/companies' => 'requests#companies'
end
