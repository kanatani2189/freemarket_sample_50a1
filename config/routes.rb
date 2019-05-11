Rails.application.routes.draw do
  devise_for :users
  root 'item_messages#index'
  resources :item_messages, only: [:index, :new, :show, :edit]
  resources :my_pages, only: [:index, :show,:new,:edit]

end
