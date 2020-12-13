FactoryBot.define do
  factory :item do
    name {Faker::Name.initials}
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    price {500}
    state_id {3}
    category_id {3}
    prefecture_id {3}
    burden_id {3}
    shipping_day_id {3}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
