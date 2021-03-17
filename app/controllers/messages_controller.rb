class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    get_messages
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(messages_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      get_messages
      render :index
    end
  end

  private

  def messages_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def get_messages
    @messages = @room.messages.includes(:user)
  end
end
