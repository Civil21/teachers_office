Rails.application.routes.draw do

  root to: "posts#index"
  get 'news', to: "posts#index"
  get "profile",to: "pages#profile"
  get "schedule",to: "pages#schedule"

  devise_for :users
  resources :homeworks, only: [:index, :create, :update]
  resources :lessons, only: [:index, :update]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
