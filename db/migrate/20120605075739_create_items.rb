class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.text :image
      t.text :url
      t.string :itemcategory
      t.string :infocategory
      t.string :program
      t.string :corner

      t.timestamps
    end
  end
end
