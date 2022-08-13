class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  # validations

  
  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  