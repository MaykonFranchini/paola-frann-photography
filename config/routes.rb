Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/books', to: "books#index", as: :books
  resources :books, only:[:show] do
    resources :orders, only: [:new]
  end
  resources :orders, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
