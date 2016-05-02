AnonPersonals::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :personals do
    resources :messages, only: :create
  end
  resources :messages, only: [:new, :destroy, :index, :show]

end
