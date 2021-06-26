class Public::ItemsController < ApplicationController
  def index
    @items_count = Item.all
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:genre_id])
  end

  def search
    @genre = Genre.find_by(id: params[:genre_id])
    @items = Item.all.page(params[:page]).per(8)
    @items_count = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :information, :price, :is_active, :genre_id)
  end
end
