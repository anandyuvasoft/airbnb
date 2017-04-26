class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id
  include PublicActivity::Common
  
  def message_time
    created_at.strftime("%v")
  end
end
