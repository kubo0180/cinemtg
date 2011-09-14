class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.boolean :public_flag
      t.integer :point

      t.timestamps
    end
  end
end
