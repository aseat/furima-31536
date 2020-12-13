class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shippingday
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :user
  has_one :product_purchase
  has_one_attached :image
  validates :image,presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "Select" }, presence: true
  validates :state_id, numericality: { other_than: 1, message: "Select" }, presence: true 
  validates :burden_id, numericality: { other_than: 1, message: "Select" }, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }, presence: true 
  validates :shipping_day_id, numericality: { other_than: 1, message: "Select" }, presence: true 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
end
