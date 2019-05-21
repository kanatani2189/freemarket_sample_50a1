Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:index, :show, :new, :edit]

  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'

  #pay.jp
  resources :cards, only: [:index, :new, :destroy] do
    collection do
      post 'purchase'
      get 'buy'
      post 'pay'
    end
  end
end
