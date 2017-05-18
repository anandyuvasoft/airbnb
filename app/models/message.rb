class Message < ActiveRecord::Base

	include PublicActivity::Common

  belongs_to :conversation
  belongs_to :user
  validates_presence_of :content, :conversation_id, :user_id
  after_create :send_notification

  def message_time
    created_at.strftime("%v")
  end

  def send_notification
		self.create_activity :create, owner: self.conversation.sender, recipient: self.conversation.recipient
  end

end
