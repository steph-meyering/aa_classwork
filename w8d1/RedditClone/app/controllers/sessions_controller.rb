class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:destroy]
  
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    unless @user.nil?
      login(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout
  end

end