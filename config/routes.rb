Rails.application.routes.draw do
  devise_for :users
  get :profile, to: "users#show"
  resources :users, only: [:index, :edit, :update]
  root "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
