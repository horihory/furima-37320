class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "Sales status can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "Shipping fee status can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "Prefecture can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "Scheduled delivery can't be blank"}
end
