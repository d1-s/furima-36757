FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.words}
    item_info         {Faker::Lorem.sentence}
    category_id       {'2'}
    item_status_id    {'2'}
    delivery_fee_id   {'2'}
    prefecture_id     {'2'}
    send_days_id      {'2'}
    price             {Faker::Number.number(digits: 5)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
