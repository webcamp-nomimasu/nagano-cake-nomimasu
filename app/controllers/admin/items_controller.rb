class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :allergy_string, only: [:create, :update]

  def index
    @items = Item.page(params[:page]).per(10).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render 'edit'
    end
  end

  private

  def allergy_string
    if params[:item][:allergies].present?
      params[:item][:allergies] = params[:item][:allergies].join(" ")
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :information, :genre_id, :price, :is_active, :allergies)
  end

end
