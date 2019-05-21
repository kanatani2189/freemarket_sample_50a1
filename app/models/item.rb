class Item < ApplicationRecord
  has_many :user_items
  has_many :users, through: :user_items
  has_many_attached :images
  has_many :parent_categories
  accepts_nested_attributes_for :parent_categories
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length: { maximum: 40}
  validates :description, presence: true
  validates :condition, presence: true
  validates :shipping_burden, presence: true
  validates :shipping_method, presence: true
  validates :prefecture_id, presence: true
  validates :estimated_date, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 99999999 }
end
