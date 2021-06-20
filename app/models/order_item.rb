class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  attribute :making_status, :integer, default: "0"
  enum making_status: {
    着手不可:0,
    製作待ち:1,
    製作中:2,
    製作完了:3
  }
  
  validates :item_id, :order_id, :price, :amount, presence: true
  
  
  def change_order_status
    items = self.order.order_items
    if self.making_status == "製作中"
      self.order.update(status: "製作中")
    elsif items.pluck(:making_status).all?{ |status| status == "製作完了"}
      self.order.update(status: "発送準備中")
    end
  end
  
end
