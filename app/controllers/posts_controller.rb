class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, success: "Post successfully created!"
    else
      render :new
    end
  end

  def edit
    authorize @post
  end
  
  def update
    authorize @post
    
    if @post.update(post_params)
      redirect_to @post, success: "Post successfully updated!"
    else 
      render :edit
    end
  end

  def show
  end

  def destroy
    if @post.delete
      redirect_to posts_path, success: "Post successfully deleted!"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :date, 
      :rationale,
      :user_id)
  end
end
