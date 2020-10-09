FactoryBot.define do
  factory :user_order do
      post_number        {'123-4567'}
      prefecture_id      {"2"}
      city               {"仙台"}
      block              {"1-2-1"}
      building           {"102"}
      tele_number        {"08012345678"}
      token              {"tok_4098b95c1eeb16d5769f554d5225"}
  end
end


