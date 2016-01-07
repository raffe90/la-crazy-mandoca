Rails.application.routes.draw do
  root 'home#index'

  get 'home/profile'

  resources :posts

  resources :images

  resources :videos

  get '/posts/:type/:id/:title' => 'posts#show', :as => :post_with_title

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
end
