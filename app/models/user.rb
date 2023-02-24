class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 1..250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def returns_last_three_post
    posts.last(3)
  end
end
