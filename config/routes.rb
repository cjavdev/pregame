Rails.application.routes.draw do
  root to: 'ideas#index'

  resources :ideas
  resource :session, only: [:new, :create, :delete]
end
