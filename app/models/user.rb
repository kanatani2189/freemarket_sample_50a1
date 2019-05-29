class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :images
  has_many :user_items
  has_many :items, through: :user_items
  has_many :sns_credentials

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


  
  def self.find_or_create_from_auth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
          SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
          
        else
          user = User.new(
            nickname: auth.info.name,
            email:    auth.info.email,
            password: Devise.friendly_token[0, 20],
            )
          snscredential = SnsCredential.create(
              uid: uid,
              provider: provider,
            )
          
        end
    end
    return {user: user, snscredential: snscredential}
  end
end
