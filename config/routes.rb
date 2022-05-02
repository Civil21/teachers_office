Rails.application.routes.draw do
  get 'homework/group:references'
  get 'homework/subject:references'
  get 'homework/attendance:references'
  devise_for :users
  get 'news', to: "posts#index"
  root to: "pages#index"
  get "profile",to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
