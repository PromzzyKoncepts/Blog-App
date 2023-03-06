class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: @user.id)
    # @posts = Post.where(author_id: @user.id)
    # @posts = User.find(params[:user_id]).posts.includes(:comments)
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0
    return unless @post.save

    redirect_to user_posts_path(user_id: current_user.id)
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
