Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :attractions

  get '/admin/signup' => 'users#new'
  post '/admin/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  patch '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#delete'

  post 'ride' => 'rides#create'
end
