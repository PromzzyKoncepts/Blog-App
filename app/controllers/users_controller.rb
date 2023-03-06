class UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.includes(:posts)
  end

  def show
    # @user = User.find(params[:id])
    @user = User.includes(:posts).find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
