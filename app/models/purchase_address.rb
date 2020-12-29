class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :addresses, :municipality, :prefecture_id, :phone_number, :build_name, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :municipality
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :addresses
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_address = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, municipality: municipality, prefecture_id: prefecture_id, addresses: addresses, build_name: build_name, phone_number: phone_number, purchase_id: purchase_address.id)
  end
end
