Rails.application.routes.draw do
  root to: 'ideas#index'

  resources :ideas
  resources :personas
  resource :session, only: [:new, :create, :delete]
end
