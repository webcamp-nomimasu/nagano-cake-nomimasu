class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      redirect_to addresses_path  # render?
      flash[:alert] = "すべて入力してください。"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      flash[:alert] = "すべて入力してください。"
      redirect_to request.referer
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to addresses_path
      flash[:notice] = "削除しました"
    else
      redirect_to request.referer
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
