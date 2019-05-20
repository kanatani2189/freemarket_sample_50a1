Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:index, :show, :new, :edit]

  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'

  # 商品購入画面（石川）
  get 'items/buy/123456789'       => 'items#buy'

  #pay.jp
  resources :cards, only: [:index, :new, :show, :destroy] do
    collection do
      post 'purchase'
    end
  end
end
