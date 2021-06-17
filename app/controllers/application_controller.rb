class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  
  
  def after_sign_in_path_for(resource)
    admin_orders_path
  end 
  
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
