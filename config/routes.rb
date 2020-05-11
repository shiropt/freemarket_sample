Rails.application.routes.draw do
  devise_for :users
  root 'items#show'
end
