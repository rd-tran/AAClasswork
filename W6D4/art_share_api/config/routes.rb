Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy] do
    resources :artworks, only: :index
    resources :comments, only: :index
    resources :likes, only: :index
  end

  resources :artworks, only: [:create,  :destroy] do
    resources :artwork_shares, only: :index
    resources :comments, only: :index
    resources :likes, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: :index
  end
  

  resources :likes, only: [:create, :destroy]
end
