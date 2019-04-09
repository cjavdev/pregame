Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :ideas
  resources :personas
  resource :session, only: [:new, :create, :delete]
  get '/logout', action: 'destroy', controller: 'sessions'
end
