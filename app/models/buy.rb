class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipment

  validates :user, presence: true
  validates :item, presence: true
end
