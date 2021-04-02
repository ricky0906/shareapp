class UsersController < ApplicationController
  def edit
  end

  def show
   @user = User.find(params[:id])
   @messages = @user.messages
   @favorite_messages = @user.favorite_messages
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :email)
  end
end
