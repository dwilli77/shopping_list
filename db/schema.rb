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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_30_090427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_notes", force: :cascade do |t|
    t.bigint "author_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["author_id"], name: "index_item_notes_on_author_id"
    t.index ["item_id"], name: "index_item_notes_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "creator_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_items_on_creator_id"
    t.index ["manager_id"], name: "index_items_on_manager_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "actor_id"
    t.datetime "read_at"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_notes", "items"
  add_foreign_key "item_notes", "users", column: "author_id"
  add_foreign_key "items", "users", column: "creator_id"
  add_foreign_key "items", "users", column: "manager_id"
end
