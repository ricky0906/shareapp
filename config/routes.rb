Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :rooms, only: [:create] do
    resources :messages, only: [:index, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  resources :favorites, only: :show
end