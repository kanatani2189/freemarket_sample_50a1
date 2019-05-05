## usersテーブル

| Column           | Type    | Option                         |
|------------------|---------|--------------------------------|
| nickname         | string  | null: false                    |
| email            | text    | null: false, unique: true      |
| password         | text    | null: false                    |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| birth_year       | integer | null: false                    |
| birth_month      | integer | null: false                    |
| birth_date       | integer | null: false                    |
| city             | string  | null: false                    |
| address          | text    | null: false                    |
| street           | text    | null: false                    |
| area_id          | references  | null: false, foreign_key: true |

## Association
- belongs_to :area
- has_many :items, through: :user_items
- has_many :images
- has_many :item_comments
- has_many :likes

## itemsテーブル

| Column          | Type       | Option                         |
|-----------------|------------|--------------------------------|
| name            | text       | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| condition       | text       | null: false                    |
| size            | text       |                                |
| shipping_burden | text       | null: false                    |
| shipping_method | text       | null: false                    |
| estimated_date  | text       | null: false                    |
| area_id         | references | null: false, foreign_key: true |
| brand_id        | references | null: false, foreign_key: true |
　
## Association
- belongs_to :brand
- has_one :parent_category
- belongs_to :area
- has_many :users, through: :user_items
- has_many :images
- has_many :likes

## user_itemsテーブル
| Column   | Type       | Option                         |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item  

## imagesテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| name    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user

## commentsテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| comment | text       |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user

## likesテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user

## parent_categoriesテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| item_id | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- has_one :large_category
- has_one :midium_category
- has_one :small_category

## large_categoriesテーブル

| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------|
| parent_category_id | references | null: false, foreign_key: true |
| category_name      | text       | null: false                    |

## Association
- belongs_to :parent_category

## midium_categoriesテーブル

| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------|
| parent_category_id | references | null: false, foreign_key: true |
| category_name      | text       | null: false                    |

## Association
- belongs_to :parent_category

## small_categoriesテーブル

| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------|
| parent_category_id | references | null: false, foreign_key: true |
| category_name      | text       | null: false                    |

## Association
- belongs_to :parent_category

## brandsテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| name    | text       |                                |

## Association
- has_many :items

## areasテーブル

| Column | Type   | Option |
|--------|--------|--------|
| name   | string |        |

## Association
- has_many :items
- has_many :users






