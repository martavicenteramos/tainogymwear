Rails.application.routes.draw do
  get 'wishlists/index'
  get 'wishlists/show'
   devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  root to: 'pages#home'
  get "questionaire", to: 'pages#questionaire'
  get "users", to: 'pages#users'
  get "about_us", to: 'pages#about_us'

  resources :products, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :order_products, only: [:create]
  end

  resources :orders do
    resources :payments, only: :new
  end

  get "cart", to: "orders#cart"

  resources :orders, only: [:edit, :update, :index] do
    get "review_information", to: "orders#review_information"
  end

  post "checkout", to: "orders#checkout"

  resources :order_products, only: [:destroy] do
    member do
      patch :add, defaults: { format: :js }
      patch :remove
    end
  end

  resources :users, only: [:update]
  get '/profile', to: "users#show"

  resources :user_colours, only: [:new, :create]

  resources :user_styles, only: [:new, :create]

  resources :user_product_types, only: [:new, :create]

  resources :wishlists, only: [:new, :create, :index, :destroy]

  # patch 'order_products/:id/add', to: 'order_products#add', as: 'add'
  # patch 'order_products/:id/remove', to: 'order_products#remove', as: 'remove'
  # resources :users, only: [:show] do
  #   resources :user_style
  #   resources :user_colour
  #   resources :user_product_type
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
