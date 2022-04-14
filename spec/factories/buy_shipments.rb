FactoryBot.define do
  factory :buy_shipment do
    postal_code     { '123-4567' }
    prefecture_id   { 14 }
    city            { '横浜市緑区' }
    address_line    { '青山１−１' }
    building        { '柳ビル103' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
