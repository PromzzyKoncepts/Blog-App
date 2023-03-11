class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  after_save :update_posts_counter
  after_destroy :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    if destroyed?
      author.reload.decrement!(:posts_counter)
    else
      author.reload.increment!(:posts_counter)
    end
  end
end
