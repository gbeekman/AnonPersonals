AnonPersonals::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create, :show] do
    resources :personals, only: :create
  end

  resource :session, only: [:new, :create, :destroy]
  resources :personals, except: :create

end
