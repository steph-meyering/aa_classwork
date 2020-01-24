class UsersController < ApplicationController
  def index
   render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def show
    render json: User.find(params[:id])
  end

  def update

    #its the way only change one attribute and its not chacking the permissions.
    # updated = User.update(params[:id], :name => params[:user][:name])
    # render json: updated

    #its making all changes to spesified id
    updated = User.find(params[:id])
    updated.update(user_params)
    render json: updated
  end

  def destroy
    destroyed = User.find(params[:id])
    destroyed.delete
    render json: destroyed
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
