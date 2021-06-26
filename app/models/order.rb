class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  enum payment_method: {クレジットカード:0, 銀行振込:1}
  attribute :status, :integer, default: "0"
  enum status: {入金待ち:0, 入金確認:1,  製作中:2, 発送準備中:3, 発送済み:4}
  attribute :shipping_cost, :integer, default: "800"

  NUMBER_REGEXP = /\A[0-9]+\z/

  validates :customer_id, :payment_method, :address, :name,   presence: true
  validates :postal_code, presence: true, format: { with: NUMBER_REGEXP }
  
  def change_making_status
    if self.status == "入金待ち"
      self.order_items.update_all(making_status: :着手不可)
    elsif self.status == "入金確認"
      self.order_items.update_all(making_status: :製作待ち)
    end
  end

end
