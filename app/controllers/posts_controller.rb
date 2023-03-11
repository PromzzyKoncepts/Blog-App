class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_params, only: %i[create]
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: @user.id)
    @posts = Post.includes(:comments).where(author_id: @user.id)
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

  def destroy
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
    return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false if @post.nil?

    if @post.destroy
      redirect_to user_posts_path(current_user)
    else
      redirect_to user_post_path(current_user, @post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
