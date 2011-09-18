class AddUserIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :user_id, :integer, :default=>"0", :null=>false
    add_index :entries,  [:user_id, :updated_at]
  end
end
