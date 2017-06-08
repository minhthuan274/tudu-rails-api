Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :tasks,     only: [:index, :show, :create, :update, :destroy]
  resources :todos,     only: [:create, :update, :destroy]

  post '/mark_all_done', to: 'todos#mark_all_done'
end
