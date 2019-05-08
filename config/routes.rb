Rails.application.routes.draw do
  root 'item_messages#index'
  get "user_profiles" => "user_profiles#edit"
end
