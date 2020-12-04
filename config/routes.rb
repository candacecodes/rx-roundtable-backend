Rails.application.routes.draw do
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  resources :comments
  resources :selectedrxes
  resources :rxes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
