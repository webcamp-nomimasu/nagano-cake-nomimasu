class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8).order(:id)
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:genre_id])
  end

  def search
    # if params([:genre_id]).present?
      @genre = Genre.find_by(id: params[:genre_id])
    # else
      # @genres = Genre.all
  #   end
      @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # def Genre.search(search_word)
  #   Genre.where(name: "search_word")
  # end

  

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :information, :price, :is_active, :genre_id)
  end
end
