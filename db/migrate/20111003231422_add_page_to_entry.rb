class AddPageToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :page, :integer
  end
end
