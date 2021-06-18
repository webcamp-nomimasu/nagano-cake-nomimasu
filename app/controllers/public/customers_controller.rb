class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render "edit"
    end
  end

  def unsubscribe
  end
  
  def withdraw
  end


  private

  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :kana_family_name, :kana_given_name, :postal_code, :address, :phone_number, :email)
  end
end

