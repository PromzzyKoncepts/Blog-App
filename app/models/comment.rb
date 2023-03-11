class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_comments_counter
  after_destroy :update_comments_counter

  private

  def update_comments_counter
    if destroyed?
      post.decrement!(:comments_counter)
    else
      post.increment!(:comments_counter)
    end
  end
end
