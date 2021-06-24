class Admin::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value)
  end
  
  
  private
  
  def search_for(model, value)
    if model == 'customer'
      Customer.where("family_name || given_name LIKE ?", "%#{value}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{value}%")
    end
  end
  
end
