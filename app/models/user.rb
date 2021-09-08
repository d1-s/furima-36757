class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates :nickname, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :birthday, presence: true
end
