class UsersController < ApplicationController
  def index 
    render plain: "my husband is a software engineer"
  end

  def create
    render json: params
  end

  def show
    user = User.find_by(id:params[:id])
    render json: user
    
  end

end
