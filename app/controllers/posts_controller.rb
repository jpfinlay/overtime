class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully edited!"
      redirect_to @post
    else 
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.delete
      flash[:notice] = "Post deleted."
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :rationale, :user_id)
  end
end
