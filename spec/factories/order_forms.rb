FactoryBot.define do
  factory :order_form do
    token              { 'tok_abcdefghijklmnopqr0123456789' }
    postal_code        { '123-4567' }
    prefecture_id      { 2 }
    municipalities     { '大阪市' }
    address            { '1-1' }
    building           { '大阪ビル' }
    tel_number         { Faker::Number.leading_zero_number(digits: 10) }
  end
end
