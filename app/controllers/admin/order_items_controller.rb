class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_item = OrderItem.find(order_item_params)
    @order_item.update
    redirect_to admin_order_path(@order_item.order.id)
  end
  
  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
end
