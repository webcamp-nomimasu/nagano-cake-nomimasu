class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  attribute :status, :integer, default: "0"
  enum status: {
    waiting_payment: 0,
    payment_confirmation: 1,
    under_production: 2,
    ready_shipping: 3,
    sented: 4
  }
end