class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_likes_counter
    post.increment!(Likes_Counter)
  end
end
