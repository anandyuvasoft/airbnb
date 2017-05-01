class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
			devise_parameter_sanitizer.permit(:account_update) do |u| 
				u.permit(:email, :password, :password_confirmation, :fullname, :phone_number, :description, relatives_attributes: [:name,:relation], friends_attributes: [:name,:email]) 
			end
    end
end
