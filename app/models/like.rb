class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_likes_counter

  private

  def update_likes_counter
    if destroyed?
      post.decrement!(:likes_counter)
    else
      post.increment!(:likes_counter)
    end
  end
end
