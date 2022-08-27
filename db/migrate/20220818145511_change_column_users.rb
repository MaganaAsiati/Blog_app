class ChangeColumnUsers < ActiveRecord::Migration[7.0]
  def change
remove_column :users, :Posts_Counter
add_column :users, :Posts_Counter, :integer, default: 0 
  end
end
