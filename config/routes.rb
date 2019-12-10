Rails.application.routes.draw do
 
  root to: 'events#index'
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show index]
  post '/events/:id', to: 'events#attend'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  #resources :attendances, only: %i[new create]
end
