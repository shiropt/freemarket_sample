Rails.application.routes.draw do

  devise_for :users,
    controllers: { registrations: 'users/registrations',
    sessions: 'users/sessions' }
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :buyers, only:[:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'buy', to: 'buyers#buy'
      end
    end
  end
  resources :category, only:[:index,:show]
  resources :users, only: [:show]

  root 'items#index'
  resources :cards, only:[:index, :new, :create, :destroy]

end

