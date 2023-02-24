class User < ApplicationRecord
  has_many :posts
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def returns_last_three_post
    posts.last(3)
  end
end
