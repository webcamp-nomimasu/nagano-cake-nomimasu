class Public::OrdersController < ApplicationController
 
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end
  
end
