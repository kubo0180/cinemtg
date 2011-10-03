class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :asin
      t.string :isbn
      t.string :title

      t.timestamps
    end
  end
end
