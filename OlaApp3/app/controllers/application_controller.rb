class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	if resource_class == User
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile, :address, :role, ])
  	end
  	if resource_class == Driver
			devise_parameter_sanitizer.permit(:sign_up, keys: [:cab_type, :license_no, :expiry_date, :mobile, :name, :address])
  	end
  end
end