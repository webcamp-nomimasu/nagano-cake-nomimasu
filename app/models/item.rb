class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_many :comments
  attachment :image

  validates :name, presence: true
  validates :information, presence: true
  validates :price, presence: true
  validates :allergies, presence: true
end
