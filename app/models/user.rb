class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def returns_last_three_post
    posts.last(3)
  end

  def admin?
    role == 'admin'
  end
end
