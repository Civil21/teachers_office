Rails.application.routes.draw do

  root to: "pages#home"
  get 'news', to: "posts#news"
  get "profile",to: "pages#profile"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :homeworks, only: [:index]
  resources :lessons, only: [:index]
end
