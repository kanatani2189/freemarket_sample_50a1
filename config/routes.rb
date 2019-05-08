Rails.application.routes.draw do
  root 'item_messages#index'
  resources :item_messages, only: [:index, :new, :show, :edit]
end
