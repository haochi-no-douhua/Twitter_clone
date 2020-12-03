Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'tops#index'
  resources :users, only: [:new, :create, :show]
  resources :tweets do
    collection do
      post :confirm
    end
  end
end
