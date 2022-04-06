class Shipment < ApplicationRecord
  belongs_to :buy

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address_line, presence: true
  VALID_PHONE_NUMBER_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :buy, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
