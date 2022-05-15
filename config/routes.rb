Rails.application.routes.draw do
  root to: 'posts#index'
  get 'news', to: 'posts#index'
  get 'profile', to: 'pages#profile'
  get 'schedule', to: 'pages#schedule'

  devise_for :users
  resources :homeworks, only: %i[index create update]
  resources :lessons, only: %i[index update]

  devise_for :admin_users, ActiveAdmin::Devise.config
  namespace :admin do
    get 'students/import', to: 'students#import'
    post 'students/import_file', to: 'students#import_file'
  end
  ActiveAdmin.routes(self)
end
