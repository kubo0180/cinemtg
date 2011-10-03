class AddPageToBook < ActiveRecord::Migration
  def change
    add_column :books, :page, :integer
  end
end
