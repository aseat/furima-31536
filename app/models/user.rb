class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :name, presence: true
         validates :family_name, presence: true
         validates :namekana, presence: true
         validates :family_namekana, presence: true
         validates :birth, presence: true
         has_many :items
         has_many :product_purchases
end
