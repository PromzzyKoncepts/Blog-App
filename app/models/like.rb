class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update(id)
    Post.find(id).increment!(:likes_counter)
  end
end
