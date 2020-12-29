Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
   resources :addresses, only: [:index, :create]
  end
  resources :purchases, only: [:index, :create, :new]
end
