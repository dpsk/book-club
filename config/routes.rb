BookClub::Application.routes.draw do
  resources :books
  resources :sessions, only: [:new, :destroy]
  root to: "books#index"
end
