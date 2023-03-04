class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    return unless @like.save
    redirect_to user_post_path(@like.author_id, @like.post_id)
  end

  # def like_params
  #   { author: current_user, post_id: params.require(:post_id) }
  # end
end