class CreateUserItem < ActiveRecord::Migration
  def up
      create_table :users_items, :id => false do |t|
          t.references :user
          t.references :item
      end
  end

  def down
      drop_table :users_items
  end
end
