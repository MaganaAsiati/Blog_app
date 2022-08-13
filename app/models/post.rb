class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  def updates_posts_counter
    posts.increment!(:Posts_Counter)
  end

  
end
