FactoryBot.define do

  factory :item do
    #image {Faker::Lorem.sentence}
    association :user 

    item_name      {"hoge"}
    item_text      {"fuga"}
    price          {321}
    category_id    {2}
    condition_id   {2}
    shipping_fee_id   {2}
    area_id        {2}
    shipping_day_id  {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
