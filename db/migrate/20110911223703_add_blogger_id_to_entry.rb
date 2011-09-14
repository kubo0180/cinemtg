class AddBloggerIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :blogger_id, :integer, :default=>"0", :null=>false
    add_index :entries,  [:blogger_id, :updated_at]
  end
end
