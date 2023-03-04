class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    redirect_to user_post_path(user_id: current_user.id, id: params[:post_id]) if @comment.save
  end

  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end