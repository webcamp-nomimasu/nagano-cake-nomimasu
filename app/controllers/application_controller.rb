class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :given_name, :kana_family_name, :kana_given_name, :postal_code, :address, :phone_number])
  end
end
