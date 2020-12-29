FactoryBot.define do
  factory :purchase_address do
    post_number { '123-4567' }
    prefecture_id { 14 }
    addresses { '横浜市' }
    municipality { '西区みなとみらい2丁目' }
    build_name { 'ランドマーク87階' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
