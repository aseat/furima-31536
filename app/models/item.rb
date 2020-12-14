class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :state
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shippingday
  belongs_to :burden
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end
  with_options numericality: { other_than: 1, message: 'Select' }, presence: true do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :prefecture_id
    validates :shippingday_id
  end
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
end
