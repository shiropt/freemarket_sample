Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
 
  devise_for :users,
     controllers: { registrations: 'users/registrations',
                    sessions: 'users/sessions' }
  resources :items, only:[:index, :show]
  resources :category, only:[:index,:show]
  resources :buyers, only:[:show] do
    collection do
      get 'done'
    end
  end
  root 'items#index'

end

