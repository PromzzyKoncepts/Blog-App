class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def returns_last_three_post
    posts.last(3)
  end
end
