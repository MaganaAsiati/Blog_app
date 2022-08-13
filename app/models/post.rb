class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments
  # validations

  validates :Title, presence: true, length: { maximum: 250 }
  validates :Comments_Counter, :Likes_Counter, numericality: { only_integer: true },
                                               comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

 
  after_save :update_post_counter

  def update_post_counter
    author.increment(:Posts_Counter)
  end
end
