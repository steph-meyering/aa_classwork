class SubsController < ApplicationController

  before_action :require_moderator, only: [:edit, :update]
  ############################################ double work?

  def new
    @sub = Sub.new
    render :new
  end
  
  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub
      render :edit
    else
      flash[:errors] = @sub.errors.full_messages
    end

    # @sub = Sub.find_by(id: params[:id])
    # if @sub && @sub.moderator == current_user.id
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub && @sub.update_attributes(sub_params)
      render :show
      # redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator)
  end

  def require_moderator
    @sub = Sub.find_by(id: params[:id])
    unless current_user.id == @sub.author_id
      flash[:errors] = ["Only moderators can edit the sub"]
      redirect_to edit_sub_url(@sub)
    end
  end

end
