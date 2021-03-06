Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/books', to: "books#index", as: :books
  resources :books, only:[:show, :new, :create]
    resources :orders, only: [:show, :create] do
      resources :payments, only: :new
    end
    mount StripeEvent::Engine, at: '/stripe-webhooks'
    
    resources :orders, only: [:dashboard]
    resources :studios, only:[:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
