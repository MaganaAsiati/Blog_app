class User < ApplicationRecord
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  # validations
  validates :Name, presence: true
  validates :Posts_Counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
