class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @total_price = @cart_items.sum{|c| c.item.add_tax_price * c.amount }
    # @total_price = total_order_price
    @sum = 0
    @shipping_cost = 800
    @total_price = @sum + @shipping_cost
    # @order.total_price = @order.shipping_cost + @total_price
    if params[:order][:address_option] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.family_name + current_customer.given_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order = Order.new(order_params)
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item.id
      order_item.order_id = @order.id
      order_items.price = cart.item.price
      order_items.amount = cart.amount
      order_item.save!
      cart.destroy_all
    end
    redirect_to orders_complete_path
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price, :order_status )
  end


end
