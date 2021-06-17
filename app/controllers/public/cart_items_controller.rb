class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    end

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItems.where(customer_id: current_customer.id)
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_items = current_customer.cart_items
    @cart_item.destroy
  end

  def destroy_all
    CartItem.where(customer_id: current_customer.id).destroy_all
    @cart_items = current_customer.cart_items
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
