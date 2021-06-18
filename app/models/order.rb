class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer

  NUMBER_REGEXP = /\A[0-9]+\z/

  validates :customer_id, :payment_method, :address, :name,   presence: true
  validates :postal_code, presence: true, format: { with: NUMBER_REGEXP }

end
