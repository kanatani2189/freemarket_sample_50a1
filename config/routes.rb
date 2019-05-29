Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :show, :create, :edit, :update, :destroy, ]
  resources :users, only: [:index, :show, :new, :edit]
  get "items/buy/123456789" =>"items#buy"
  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'
  get "items/search/123" => "items#search"

  get "items/category/:date" => "items#category"

  #pay.jp
  resources :cards, only: [:index, :new, :destroy] do
    collection do
      post 'purchase'
      get 'buy'
      post 'pay'
    end
  end
end
