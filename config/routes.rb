Rails.application.routes.draw do
  root 'home#index'

  get 'home/profile'

  resources :posts

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
end
