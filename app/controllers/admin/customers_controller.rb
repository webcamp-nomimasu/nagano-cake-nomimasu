class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page]).per(10)
    
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_customers_path
    else
      flash.now[:alert] = "保存できませんでした"
      render :edit
    end
  end

  private
  def customer_params
     params.require(:customer).permit(:family_name, :given_name, :kana_family_name, :kana_given_name,
                                       :postal_code, :address, :phone_number, :email, :is_deleted,  )
  end
end
