Rails.application.routes.draw do

  devise_for :users
  get 'items/index'
  root to: "items#index"
  
  get 'items', to: 'items#index'

  resources :items, only: [:index, :new, :create, :destroy, :edit, :update, :show]
end