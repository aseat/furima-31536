FactoryBot.modify do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { Gimei.last.kanji }
    name { Gimei.last.kanji }
    family_namekana { Gimei.last.katakana }
    namekana { Gimei.first.katakana }
    birth { '1998-12-19' }
  end
end
