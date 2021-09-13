class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ヴ一-龥]+\z/u
  KANA_REGEX = /\A[ァ-ヴー]+\z/u
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  validates :password, format: { with: PASSWORD_REGEX }
  with_options presence: true, format: { with: NAME_REGEX } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: KANA_REGEX } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
  has_many :orders
end
