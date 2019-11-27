Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  get "questionaire", to: 'pages#questionaire'


  get "profile", to: 'profiles#show', as: :profile
  post "profile/update", to: 'profiles#update'

  resources :products, only: [:index, :show] do
    resources :order_products, only: [:create]
  end
  resources :orders, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
