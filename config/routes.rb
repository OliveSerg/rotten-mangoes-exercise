Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'users/new'

  get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root "movies#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end
