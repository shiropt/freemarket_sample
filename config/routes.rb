Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
 
  devise_for :users,
     controllers: { registrations: 'users/registrations',
                    sessions: 'users/sessions' }
  resources :items
  resources :category, only:[:index,:show]
  root 'items#index'

end

