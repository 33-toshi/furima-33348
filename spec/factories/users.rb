FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
