Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  # Static pages
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
