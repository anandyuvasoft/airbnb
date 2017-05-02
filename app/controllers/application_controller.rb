class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token 
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_doctor, :current_patient,:require_doctor!, :require_patient!, :doctor_logged_in?, :patient_logged_in?
  after_filter :store_location

  def account_url
    return new_user_session_url unless user_signed_in?
    return session[:previous_url] if session[:previous_url].present?
    case current_user.class.name
    when "patient"
      patient_root_url
    when "doctor"
      doctor_root_url
    else
      root_url
    end if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || account_url
  end

  private

    def store_location
      session[:previous_url] = request.fullpath
    end

    def current_patient
      @current_patient ||= current_user if user_signed_in? and current_user.class.name == "patient"
    end

    def current_doctor
      @doctor_doctor ||= current_user if user_signed_in? and current_user.class.name == "doctor"
    end

    def patient_logged_in?
      @patient_logged_in ||= user_signed_in? and current_patient
    end

    def doctor_logged_in?
      @doctor_logged_in ||= user_signed_in? and current_doctor
    end

    def require_patient
      require_user_type(:patient)
    end

    def require_doctor
      require_user_type(:doctor)
    end

    def require_user_type(user_type)
      if (user_type == :doctor and !doctor_logged_in?) or
        (user_type == :patient and !patient_logged_in?)
        redirect_to root_path, status: 301, notice: "You must be logged in a#{'n' if user_type == :admin} #{user_type} to access this content"
        return false
      end
    end



  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :gender, :phone_number, :birthday])
			devise_parameter_sanitizer.permit(:account_update) do |u| 
				u.permit(:email, :password, :password_confirmation, :fullname, :phone_number, :description, relatives_attributes: [:name,:relation], friends_attributes: [:name,:email]) 
			end
    end
end
