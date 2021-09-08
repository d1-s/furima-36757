class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ヴ一-龥]+\z/u
  KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates :nickname, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :last_name, presence: true, format: { with: NAME_REGEX }
  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :birthday, presence: true
end
