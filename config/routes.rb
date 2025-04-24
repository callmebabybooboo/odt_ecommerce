Rails.application.routes.draw do
  resource :cart, only: [ :show ]
  resources :cart_items, only: [ :create, :update, :destroy ]
  resources :orders, only: [ :index, :new, :create, :show ] do
    member do
      patch :pay
      patch :cancel
    end
  end

  devise_for :users

  authenticated :user do
    root to: "home#index", as: :authenticated_root
    resources :products, only: [ :show ]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
    resources :products
  end

  resources :products, only: [ :index, :show ]

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
