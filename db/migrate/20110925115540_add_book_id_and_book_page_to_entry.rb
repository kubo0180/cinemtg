class AddBookIdAndBookPageToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :book_id, :integer
    add_column :entries, :book_page, :integer
  end
end
