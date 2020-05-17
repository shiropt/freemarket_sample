Rails.application.routes.draw do

  get 'buyers/index'
  get 'buyers/done'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :items, only:[:index, :show]
  resources :category, only:[:index,:show]
  root 'items#index'

end

