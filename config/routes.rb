WPrixes::Application.routes.draw do
  devise_for :users

  root to: 'home#show'

  resources :categories, only: [:index, :show] do
    resources :nominees, only: [:create]
  end
  resources :votes, only: [:create]
  resources :results, only: [:index]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
