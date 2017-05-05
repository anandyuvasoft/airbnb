module ApplicationHelper
  def avatar_url(user)
    if user.image.present?
      user.image
    else
      if Rails.env.eql? "production"
        default_url = "#{Rails.root}/images/user_default_avatar.jpg"
      else
        default_url = "https://preview.ibb.co/buAKBQ/missing.png"  if user.class.name.eql?('Doctor')
        default_url = "https://image.ibb.co/hy7wQk/missing_patient.jpg" if user.class.name.eql?('Patient')
      end
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
  end



  def active_class(link_path)
    return 'sidebar-link active' if request.path == link_path
    else
      return 'sidebar-link'
  end
end
