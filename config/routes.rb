Rails.application.routes.draw do

 
  devise_for :users,
     controllers: { registrations: 'users/registrations',
                    sessions: 'users/sessions' }
  resources :items, only:[:index, :show, :destroy]
  resources :category, only:[:index,:show]
  resources :buyers, only:[:show] do
    collection do
      get 'done'
    end
  end
  root 'items#index'

end

