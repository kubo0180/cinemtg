class ChangeColumnEntriesPublicFlag < ActiveRecord::Migration
  def up
    change_column :entries,  :public_flag,  :integer , :default=>"0",  :null => false
    add_index :entries,  [:user_id, :public_flag, :created_at]
  end

  def down
    remove_index :entries,  [:user_id, :public_flag, :created_at]
  end
end
