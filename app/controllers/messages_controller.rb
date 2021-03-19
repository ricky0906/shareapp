class MessagesController < ApplicationController
before_action :get_room, only: [:index, :create, :destroy]

  def index
    @message = Message.new
    get_messages
  end

  def create
    @message = @room.messages.new(messages_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      get_messages
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to room_messages_path(@room)
  end

  private

  def messages_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def get_messages
    @messages = @room.messages.includes(:user)
  end

  def get_room
    @room = Room.find(params[:room_id])
  end
end
