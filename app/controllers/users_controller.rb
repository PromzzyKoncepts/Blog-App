class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
