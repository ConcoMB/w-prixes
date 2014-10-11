WPrixes::Application.routes.draw do
  devise_for :users

  root to: 'home#show'

  resources :categories, only: [:index, :show]
  resources :votes, only: [:create]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
