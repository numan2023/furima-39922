FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    delivery_region_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    tel { '08012345678' }
  end
end
