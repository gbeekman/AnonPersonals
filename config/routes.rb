AnonPersonals::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create]

end
