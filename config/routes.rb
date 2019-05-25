Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :show, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :edit]
  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'

  #pay.jp
  resources :cards, only: [:index, :new, :destroy] do
    collection do
      post 'purchase' #pay.jp-POST
      get 'buy' #購入確認画面
      post 'pay' #pay.jp-POST
    end
  end
end
