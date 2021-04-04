Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :foods do
    resources :orders, only: [:index,:create]
  end
end
