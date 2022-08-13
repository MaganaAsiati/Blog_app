class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :updates_posts_counter

  private

  def updates_posts_counter
    posts.increment!(:Posts_Counter)
  end
end
