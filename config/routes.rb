BookClub::Application.routes.draw do
  resources :books, except: [:show] do
    resources :votes, except: [:show, :destroy]
  end
  match '/signout' => 'sessions#destroy', :via => :delete
  match "/auth/google_oauth2/callback", to: "sessions#create"
  root to: "books#index"
end
