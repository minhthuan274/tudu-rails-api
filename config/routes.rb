Rails.application.routes.draw do

  resources :tasks,     only: [:index, :show, :create, :update, :destroy]
  resources :todos,     only: [:create, :update, :destroy]
end
