class RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :require_no_authentication, :only => [ :new, :create]

  def new
     @token = params[:invite_token]
     super
  end

  def create
    user = build_resource(user_params)
    user.save
    @token = params[:invite_token]
    if @token != nil
       invite =  Invite.find_by_token(@token)
       user.groups.push(invite.group)
       invite.update(recipient_id: user.id)
    end
    sign_up(:user, user)
    redirect_to dashboard_path
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(resource)
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :type, :password, :password_confirmation)  
    end
end
