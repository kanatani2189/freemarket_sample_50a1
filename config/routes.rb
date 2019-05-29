Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  root 'items#index'
  resources :items, only: [:index, :new, :show, :create, :edit, :update, :destroy, ]
  resources :users, only: [:index, :show, :new, :edit]
  # get "items/buy/123456789" =>"items#buy" /cards/buyに変更
  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'
  get "items/search/123" => "items#search"
  get "items/search/456" => "items#search_item"

  get "items/category/:date" => "items#category"
  # マイページ出品一覧（内田）
  get 'users/items/ichiran'       => 'users#items_show'
  # マイページ出品一覧（内田）
  get 'users/items/:item_id'       => 'users#item_show'
  # 商品購入画面（内田）
  get "items/buy/:item_id" => "items#buy"

  #pay.jp
  resources :cards, only: [:index, :new, :destroy] do
    collection do
      post 'purchase'
      get 'buy'
      post 'pay/:item_id' => "cards#pay"
    end
  end
end
