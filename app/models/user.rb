class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶー一-龠]+\z/
  validates :last_name, presence: true, format: {with: VALID_NAME_REGEX}
  validates :first_name, presence: true, format: {with: VALID_NAME_REGEX}
  VALID_READING_KANA_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
  validates :last_name_ruby, presence: true, format: {with: VALID_READING_KANA_REGEX}
  validates :first_name_ruby, presence: true, format: {with: VALID_READING_KANA_REGEX}
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX}, length: {minimum: 6}
end
