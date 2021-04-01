Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end
  resources :rooms, only: [:create] do
    resources :messages, only: [:index, :create, :destroy] do
      resources :favorites, only: [:create, :destroy]
    end
  end
end