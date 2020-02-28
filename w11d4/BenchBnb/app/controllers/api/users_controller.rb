class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
    #   redirect_to user_url(@user)
        render '/api/users/show'
    else
      # Tell the user that something went wrong. Let them try again.
      render json: @user.errors.full_messages, status: 411
    end
  end

 

  private

  def user_params
    # params.require(:user).permit(:username, :email)
    # Add password
    params.require(:user).permit(:username, :password)
  end
end
