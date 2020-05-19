Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :items, only:[:index, :show]
  resources :category, only:[:index,:show]
  root 'items#index'

end

