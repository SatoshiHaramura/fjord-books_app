Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :books
end
