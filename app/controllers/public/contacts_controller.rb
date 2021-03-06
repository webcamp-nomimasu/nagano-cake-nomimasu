class Public::ContactsController < ApplicationController
  # コンタクトページだけコンタクトリンクを消す
  layout 'no_contact'

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      flash[:alert] = "すべて入力してください。"
      render :new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_done_path
    else
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def done
  end


  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end

end
