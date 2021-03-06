class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
    if current_customer.cart_items.empty?
      redirect_to cart_items_path
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @sum = 0
    @shipping_cost = 800
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
      if params[:order][:postal_code] != "" && params[:order][:address] != "" && params[:order][:name] != ""
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else
        flash[:alert] = "新しいお届け先が入力されていません"
        redirect_to new_order_path
      end
    end
  end

  def create
    tax = 1.1

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @cart_items = current_customer.cart_items.all
    if @cart_items.blank?
      flash[:alert] = "注文は確定しています"
      redirect_to root_path
    else
      @order.save
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item.id
        @order_item.order_id = @order.id
        @order_item.price = cart_item.item.price * tax
        @order_item.amount = cart_item.amount
        @order_item.making_status = 0
        @order_item.save!
        current_customer.cart_items.destroy_all
      end
      redirect_to orders_complete_path
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @shipping_cost = 800
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price, :order_status )
  end

end
