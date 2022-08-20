class ChangeColumnPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :Comments_Counter
    remove_column :posts, :Likes_Counter
    add_column :posts, :Comments_Counter, :integer, default: 0
    add_column :posts, :Likes_Counter, :integer, default: 0 
  end
end
