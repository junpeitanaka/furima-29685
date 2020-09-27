FactoryBot.define do
  factory :user do
    nickname                   { 'tarou' }
    email                      { 'sample@gmail.com' }
    password                   { '12345a' }
    encrypted_password         { '12345a' }
    first_name                 { '花子' }
    last_name                  { '山田' }
    first_name_kana            { 'ハナコ' }
    last_name_kana             { 'ヤマダ' }
    birthday                   { '2020-12-01' }
  end
end
