class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipment
end