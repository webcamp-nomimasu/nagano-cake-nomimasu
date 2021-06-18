class Public::OrdersController < ApplicationController
 
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order.params)
  end
  
end
