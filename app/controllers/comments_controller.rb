class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    redirect_to user_post_path(user_id: current_user.id, id: params[:post_id]) if @comment.save

    if @comment.save
      flash[:notice] = 'Comment added Successfully'
    else
      flash[:alert] = ['Comment not added, Try again']
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false if @comment.nil?

    redirect_to user_post_path(@user, params[:post_id])
    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:alert] = ['Comment not deleted']
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
