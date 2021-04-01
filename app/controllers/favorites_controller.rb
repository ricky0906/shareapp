class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    if @messaage.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, message_id: @message.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, message_id: @message.id)
    @favorite.destroy
  end
  private
  def set_message
    @message = Message.find(params[:id])
  end
end
