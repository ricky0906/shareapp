class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.build(message_id: params[:message_id])
    favorite.save
    redirect_to room_messages_path
  end

  def destroy
    favorite = Favorite.find_by(message_id: params[:message_id], user_id: current_user.id)
    favorite.destroy
    redirect_to room_messages_path
  end
end
