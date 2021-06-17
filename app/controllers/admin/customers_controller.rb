class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!


  def index
    
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end
end
