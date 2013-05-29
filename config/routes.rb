BookClub::Application.routes.draw do
  resources :books
  resources :sessions, only: [:new, :destroy]
  match "/auth/google_oauth2/callback", to: "session#create"
  root to: "books#index"
end
