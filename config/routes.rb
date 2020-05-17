Rails.application.routes.draw do
  devise_for :users,
     controllers: { registrations: 'users/registrations',
                    sessions: 'users/sessions' }
  resources :items, only:[:index,]
  resources :category, only:[:index,:show]
  root 'items#index'

end

