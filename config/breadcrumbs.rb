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

# cards#index
crumb :cards do 
  link "支払い方法", cards_path
  parent :users
end

# cards#new
crumb :new_cards do 
  link "クレジットカード情報入力", new_card_path
  parent :cards
end

# items#category
crumb :items do 
  link "カテゴリー一覧", "items/category/14"
  parent :root
end

crumb :items_ladies do 
  link "レディース", "items/category/1"
  parent :items
end

crumb :items_mens do 
  link "メンズ", "items/category/2"
  parent :items
end

crumb :items_baby do 
  link "ベビー・キッズ", "items/category/3"
  parent :items
end

crumb :items_interior do 
  link "インテリア・住まい・小物", "items/category/4"
  parent :items
end

crumb :items_book do 
  link "本・音楽・ゲーム", "items/category/5"
  parent :items
end

crumb :items_toys do 
  link "おもちゃ・ホビー・グッズ", "items/category/6"
  parent :items
end

crumb :items_cosmetics do 
  link "コスメ・香水・美容", "items/category/7"
  parent :items
end

crumb :items_appliances do 
  link "家電・スマホ・カメラ", "items/category/8"
  parent :items
end

crumb :items_sport do 
  link "スポーツ・レジャー", "items/category/9"
  parent :items
end

crumb :items_handmade do 
  link "ハンドメイド", "items/category/10"
  parent :items
end

crumb :items_ticket do 
  link "チケット", "items/category/11"
  parent :items
end

crumb :items_bicycle do 
  link "自転車・オートバイ", "items/category/12"
  parent :items
end

crumb :items_other do 
  link "その他", "items/category/1３"
  parent :items
end

