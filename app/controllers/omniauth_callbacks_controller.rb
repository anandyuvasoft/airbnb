class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    omniauth("Facebook")
  end

  def linkedin
    omniauth("Linkedin")
  end

  def google_oauth2
    omniauth("Google")
  end

  private

  def omniauth(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider ) if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

end
