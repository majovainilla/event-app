Rails.application.routes.draw do
 
  root to: 'events#index'
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
