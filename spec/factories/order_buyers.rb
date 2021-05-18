FactoryBot.define do
  factory :order_buyer do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-1234' }
    area_id        {2}
    city { '安城市' }
    house_number {2}
    building_name { 'ヨーカドー' }
    phone_number { '08012345678' }
  end
end
