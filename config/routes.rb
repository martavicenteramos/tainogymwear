Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  resources :products, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
