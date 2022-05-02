Rails.application.routes.draw do

  root to: "pages#home"
  get 'news', to: "posts#index"
  get "profile",to: "pages#profile"
  get "schedule",to: "pages#schedule"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :homeworks, only: [:index]
  resources :lessons, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
