class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    if cart_item.amount != nil
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          change_amount = cart_item.amount + @cart_item.amount
          cart_item.update(:amount, change_amount)
          @cart_item.delete
        end
      end
      @cart_item.save
      flash[:success] = "カートに商品を追加しました"
      redirect_to cart_item_path(current_customer)
    else
      redirect_to request.referer
      flash[:danger] = "数量を指定してください。"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItems.where(customer_id: current_customer.id)
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_items = current_customer.cart_items
    @cart_item.destroy
    flash[:alert] = "#{@cart_item.item.name}を削除しました。"
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.where(customer_id: current_customer.id).destroy_all
    @cart_items = current_customer.cart_items
    flash[:alert] = "カートの商品をすべて削除しました。"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
