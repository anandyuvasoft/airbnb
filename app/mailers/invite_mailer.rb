class InviteMailer < ApplicationMailer
  def new_user_invite(invite, token_url)
    @email = invite.email
    @token_url = token_url
    mail(to: @email, subject: 'Invitation for adding in group')
  end

  def existing_user_invite(invite)
    @email = invite.email
    mail(to: @email, subject: 'Invitation for adding in group')
  end
end
