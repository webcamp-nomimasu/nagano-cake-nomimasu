class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  attribute :making_status, :integer, default: "0"
  enum making_status: {
    not_startable: 0,
    waiting_production: 1,
    under_production: 2,
    production_completed: 3
  }
end
