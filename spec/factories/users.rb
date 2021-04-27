FactoryBot.define do
  #factory :user do
   # transient do
    #  person { Gimei.name }
    #end

#    nickname {"furimatarou"}
#    email {Faker::Internet.free_email}
#    password {password}
#    password_confirmation {password}
#    last_name { person.last.kanji}
#    first_name { person.first.kanji}
#    last_name_kana { person.last.katakana}
#    first_name_kana { person.first.katakana}
#    birth_day {"2000-01-01"}
#
# end

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"a12345"}
    encrypted_password    {"a12345"}
    last_name             {"山田"}
    last_name_kana        {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end