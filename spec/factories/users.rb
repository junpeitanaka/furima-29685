FactoryBot.define do
  factory :user do
    nickname                   {"tarou"}
    email                      {"sample@gmail.com"}
    password                   {"123456"}
    encrypted_password         {"123456"}
    first_name                 {"花子"}
    last_name                  {"山田"}
    first_name_kana            {"ハナコ"}
    last_name_kana             {"ヤマダ"}
    birthday                   {"2020-12-01"}


  end
end



# FactoryBot.define do
#   factory :user do
#     name {Faker::Name.last_name}
#     email {Faker::Internet.free_email}
#     password = Faker::Internet.password(min_length: 8)
#     password {password}
#     password_confirmation {password}
#   end
# end
