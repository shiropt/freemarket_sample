Rails.application.routes.draw do
  devise_for :users
  resources :items, only:[:index,:show]
  resources :category, only:[:index,:show]
  resources :signup do
    collection do
      get 'signup_select' #登録方法確認
      get 'signup_page_1' #登録ページ１
      post 'signup_page_2' #登録ページ２
      get 'done' # 登録完了後のページ
    end
  end
  root 'items#index'
end
