class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      flash[:alert] = "すべて入力してください。"
      render :new
    end
  end
  
  def done
  end  
  

  private

  def contact_params
    params.require(:contact).permit(:email,:name,:phone_number, :subject, :message)
  end

end