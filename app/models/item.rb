class Item < ApplicationRecord
  has_many :user_items
  has_many :users, through: :user_items
  has_many :images
  accepts_nested_attributes_for :images
end
