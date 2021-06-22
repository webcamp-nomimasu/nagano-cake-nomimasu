class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_many :comments
  attachment :image

  validates :name, presence: true
  validates :information, presence: true
  validates :price, presence: true
  
  before_save do
    self.shut_categories_ids.gsub!(/[\[\]\"]/, "") if attribute_present?("shut_categories_ids")
  end
end
