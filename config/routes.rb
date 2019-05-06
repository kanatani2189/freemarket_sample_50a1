Rails.application.routes.draw do
  root 'item_messages#index'
  get 'tweets' => 'tweets#index'
end
