class ChangeColumnEntriesPublicFlag < ActiveRecord::Migration
  def up
    change_column :entries,  :public_flag,  :integer , :default=>"0",  :null => false
    add_index :entries,  [:blogger_id, :public_flag, :created_at]
  end

  def down
    drop_index :entries,  [:blogger_id, :public_flag, :created_at]
  end
end
