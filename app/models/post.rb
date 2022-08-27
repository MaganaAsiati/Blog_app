class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, class_name: 'Like', foreign_key: :post_id, dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: :post_id, dependent: :destroy
  # validations

  validates :Title, presence: true, length: { maximum: 250 }
  validates :Comments_Counter, :Likes_Counter, numericality: { only_integer: true },
                                               comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:Posts_Counter)
  end
end
