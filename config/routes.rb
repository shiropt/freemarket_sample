Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'signup_select'
      get 'step1'
      post 'step2'
      get 'done' # 登録完了後のページ
    end
  end
  root 'items#show'

end
