ActiveAdmin.register Conversation do

  show do
    attributes_table do
      row :sender
      row :recipient
      row :created_at
      row :updated_at
    end
    panel "Messages" do
      @messages = conversation.messages.paginate(:page => params[:page], :per_page => 10) 
        @messages.each do |message|
          render partial: "admin/conversation/message" ,locals: {message: message}
        end
        div do
          will_paginate @messages 
        end
    end
  end

end
