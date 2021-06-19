class HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.page(params[:id]).per(10).reverse_or
  end
end
