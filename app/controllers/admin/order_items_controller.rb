class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_item = OrderItem.find(params[:order_id])
    @order_item.update(order_item_params)
    unless @order_item.order.status == "入金待ち"
      @order_item.change_order_status
    end
    redirect_to admin_order_path(@order_item.order.id)
  end
  
  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
end
