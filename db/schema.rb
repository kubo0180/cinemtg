# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111003231422) do

  create_table "books", :force => true do |t|
    t.string   "asin"
    t.string   "isbn"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "page"
  end

  create_table "comments", :force => true do |t|
    t.integer  "entry_id"
    t.string   "title"
    t.string   "body"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["entry_id"], :name => "index_comments_on_entry_id"

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "public_flag", :default => 0, :null => false
    t.integer  "point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     :default => 0, :null => false
    t.integer  "book_id"
    t.integer  "book_page"
    t.integer  "page"
  end

  add_index "entries", ["user_id", "public_flag", "created_at"], :name => "index_entries_on_user_id_and_public_flag_and_created_at"
  add_index "entries", ["user_id", "updated_at"], :name => "index_entries_on_user_id_and_updated_at"

  create_table "users", :force => true do |t|
    t.string   "provider",    :null => false
    t.string   "uid",         :null => false
    t.string   "screen_name", :null => false
    t.string   "name",        :null => false
    t.text     "image"
    t.text     "description"
    t.string   "location"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid"
  add_index "users", ["screen_name"], :name => "index_users_on_screen_name"

end
