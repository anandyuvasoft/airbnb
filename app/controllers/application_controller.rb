class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  skip_before_filter :verify_authenticity_token 
  
  before_action :authenticate_doctor!, unless: :devise_controller? 
  before_action :authenticate_patient!, unless: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_doctor, :current_patient,:require_doctor!, :require_patient!, :doctor_signed_in?, :patient_signed_in?
  
  after_filter :store_location

  def account_url
    return new_user_session_url unless user_signed_in?
    case current_user.class.name
    when "Doctor"
      if current_doctor.rooms.present?
        dashboard_path
      else
        room_steps_path
      end
    else
      user_path(current_user)
    end if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || account_url
  end

  private

    def authenticate_doctor!
      puts "*****authenticate_doctor!*****"
      authenticate_user!
      unless current_doctor
        flash[:notice] = "You need to register as doctor for looking that page."
        redirect_to root_path
      end
    end


  def authenticate_patient!
    puts "****authenticate_patient!****"
    authenticate_user!
    unless current_patient
      flash[:notice] = "You need to register as patient for looking that page."
      redirect_to root_path
    end
  end

    def store_location
      session[:previous_url] = request.fullpath
    end

    def current_patient
      @current_patient ||= current_user if user_signed_in? and current_user.class.name == "Patient"
    end

    def current_doctor
      @current_doctor ||= current_user if user_signed_in? and current_user.class.name == "Doctor"
    end

    def patient_signed_in?
      @patient_signed_in ||= user_signed_in? and current_patient
    end

    def doctor_signed_in?
      @doctor_signed_in ||= user_signed_in? and current_doctor
    end

    def require_patient
      require_user_type(:patient)
    end

    def require_doctor
      require_user_type(:doctor)
    end

    def require_user_type(user_type)
      if (user_type == :doctor and !doctor_signed_in?) or
        (user_type == :patient and !patient_signed_in?)
        redirect_to root_path, status: 301, notice: "You must be signed in a#{'n' if user_type == :admin} #{user_type} to access this content"
        return false
      end
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :gender, :phone_number, :birthday, :type])
			devise_parameter_sanitizer.permit(:account_update) do |u| 
				u.permit(
          :email, 
          :fullname, 
          :phone_number, 
          :description, 
          relatives_attributes: [
            :fullname,
            :relation,
            :phone_number,
            :gender,
            :birthday,
            :email,
            :_destroy,
            :id            
          ], 
          friends_attributes: [
            :fullname,
            :phone_number,
            :gender,
            :birthday,
            :email,
            :_destroy,
            :id
          ]
        ) 
			end
    end
end
