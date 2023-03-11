class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    if @user.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    else
      @posts = Post.where(author_id: @user.id)
    end
  end
end
