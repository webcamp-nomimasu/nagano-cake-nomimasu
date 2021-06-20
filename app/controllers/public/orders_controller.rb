class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]

  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
    # if current_customer.cart_items.empty?
    #   redirect_to cart_items_path
    # end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @total_price = @cart_items.sum{|c| c.item.add_tax_price * c.amount }
    # @total_price = total_order_price
    @sum = 0
    @shipping_cost = 800
    # @total_price = @sum + @shipping_cost
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item.id
      @order_item.order_id = @order.id
      @order_items.price = cart_item.item.price
      @order_items.amount = cart_item.amount
      @order_item.save!
      current_customer.cart_item.destroy_all
    end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @sum = 0
    @shipping_cost = 800
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if (@order.customer != current_customer) && @order.blank?
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price, :order_status )
  end

end
