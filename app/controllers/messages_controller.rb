class MessagesController < ApplicationController
  def create
   Room.find(params["room_id"])
      .messages
      .create!(message_params.merge(user_id: Current.user))
  end

  private 

  def message_params 
    params.require(:message).permit(:body)
  end
end
