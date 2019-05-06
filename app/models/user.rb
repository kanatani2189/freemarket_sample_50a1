class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[!-~&&[^a-z\d]])[!-~]{6,100}+\z/i }, format: { with: /\A(?=.*?[!-~&&[^a-z\d]])[!-~]{6,100}+\z/i }
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :family_name_kana, presence: true, length: { maximum: 35 }
  validates :first_name_kana, presence: true, length: { maximum: 35 }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_date, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :street, presence: true
  validates :area_id, presence: true
end
