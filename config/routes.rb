AnonPersonals::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :personals do
    resources :messages, only: [:new, :create]
  end
  resources :messages, only: [:destroy, :index, :show]

  resources :conversations do
    resources :chats
  end
end
