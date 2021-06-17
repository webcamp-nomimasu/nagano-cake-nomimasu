class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8).order(:id)
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:genre_id])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @genre = Genre.find_by(id: params[:genre_id])
  end

  private

  def item_params
    params.require(:product).permit(:image, :item_name, :information, :price, :is_active, :genre_id)
  end
end
