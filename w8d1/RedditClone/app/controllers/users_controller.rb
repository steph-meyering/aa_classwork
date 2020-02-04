class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def edit
    @user = current_user if current_user.id == params[:id]
    if @user
    else
      flash[:errors] = ["You can do it!!!"]
    end
    render :edit
  end
end
