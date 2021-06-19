class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1,  製作中:2, 発送準備中:3, 発送済み:4}
  
  def tax_included_price
    tax = 1.1
    price * tax
  end

  NUMBER_REGEXP = /\A[0-9]+\z/

  validates :customer_id, :payment_method, :address, :name,   presence: true
  validates :postal_code, presence: true, format: { with: NUMBER_REGEXP }

end
