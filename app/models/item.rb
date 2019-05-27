class Item < ApplicationRecord
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many_attached :images
  has_many :parent_categories, dependent: :destroy
  accepts_nested_attributes_for :parent_categories
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length: { maximum: 40}
  with_options presence: true do
    validates :description
    validates :condition
    validates :shipping_burden
    validates :shipping_method
    validates :prefecture_id
    validates :estimated_date
  end
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 99999999 }
end
