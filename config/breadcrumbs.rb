crumb :root do
  link "メルカリ", root_path
end

# user#index 
crumb :users do
  link "マイページ", users_path
  parent :root
end

# user#show
crumb :show_user do 
  link "プロフィール", user_path
  parent :users
end

# user#edit
crumb :edit_user do 
  link "本人情報の登録", edit_user_path
  parent :users
end

# users#logout
crumb :logout_user do 
  link "ログアウト", users_logout_123456789_path
  parent :users
end

# items#category
crumb :item_category do 
  link "", item_category_path
  parent :root
end