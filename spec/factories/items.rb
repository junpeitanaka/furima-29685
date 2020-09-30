FactoryBot.define do
  factory :item do
    association :user

    item_name          {'book'}
    explanation        {'SFの内容'}
    # category_id        {'レディース'}
    # state_id           {'新品、未使用'}
    # fee_delivery_id    {'着払い、購入者負担'}
    # area_delivery_id   {'北海道'}
    # day_delivery_id    {'1〜2日で発送'}
    # price              {'600'}
  end
end
