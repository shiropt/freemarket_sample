Rails.application.routes.draw do

  devise_for :users,
    controllers: { registrations: 'users/registrations',
    sessions: 'users/sessions' }
  devise_scope :user do
    get 'address_edit' => 'users/registrations#address_edit'
    get 'address_update' => 'users/registrations#address_update'
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :buyers, only:[:index] do
      collection do
        post 'buy', to: 'buyers#buy'
      end
    end
  end
  resources :category, only:[:index,:show]
  resources :users, only: [:show]

  root 'items#index'
  resources :cards, only:[:index, :new, :create, :destroy]

end

