Rails.application.routes.draw do

  get 'buyers/index'
  get 'buyers/done'
  
  devise_for :users,
  controllers: { registrations: 'users/registrations',
    sessions: 'users/sessions' }
    resources :items, except: [:edit, :update, :destroy] do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
    resources :category, only:[:index,:show]
    resources :users, only: [:show]
    resources :buyers, only:[:show]
  root 'items#index'

end

