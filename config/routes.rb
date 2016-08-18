Rails.application.routes.draw do
  resources :actors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews, only: [:new, :create]
    collection do
      get :search
    end
  end

  root to: "movies#index"

  resources :users, only: [:new, :create]
  get "/profile/:id", to: 'users#show'
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end
end
