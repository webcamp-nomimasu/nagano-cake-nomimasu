class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  

  
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def update
    @order = Order.find(order_params)
    @order.update
    redirect_to admin_order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
  
end
