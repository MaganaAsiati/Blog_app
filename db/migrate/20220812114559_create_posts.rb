class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :Title
      t.text :Text
      t.integer :Comments_Counter
      t.integer :Likes_Counter

      t.timestamps
    end
  end
end
