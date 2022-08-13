class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:Comments_Counter)
  end
end
