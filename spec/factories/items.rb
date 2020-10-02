FactoryBot.define do
  factory :item do
    item_name { 'book' }
    explanation        { 'SFの内容' }
    category_id        { '2' }
    state_id           { '2' }
    fee_delivery_id    { '2' }
    area_delivery_id   { '2' }
    day_delivery_id    { '2' }
    price              { '600' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
