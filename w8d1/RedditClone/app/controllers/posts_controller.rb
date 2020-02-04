class PostsController < ApplicationController

  before_action :require_logged_in, only: [:new, :create]
  has
  
  def edit
    @post = current_user.posts.find_by(id: params[:id])
    if @post
    else
      flash[:errors] = @post.errors.full_messages
    end
    render :edit
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post && @post.update_attributes(post_params)
      render :show
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post && @post.delete
      redirect_to sub_url(@post.sub)
    end
  end

  def new
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      render :show
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end

end
