Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
