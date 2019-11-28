Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  root to: 'pages#home'
  get "questionaire", to: 'pages#questionaire'


  get "profile", to: 'profiles#show', as: :profile
  post "profile/update", to: 'profiles#update'

  resources :products, only: [:index, :show] do
    resources :order_products, only: [:create]
  end

  resources :orders, only: [:index] do
    resources :payments, only: :new
  end

  get "cart", to: "orders#cart"

  resources :orders, only: [:edit, :update] do
    get "review_information", to: "orders#review_information"
  end

  post "checkout", to: "orders#checkout"

  resources :order_products, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
