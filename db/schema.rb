# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150524191121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_items", id: false, force: :cascade do |t|
    t.integer "color_id"
    t.integer "item_id"
  end

  add_index "colors_items", ["color_id"], name: "index_colors_items_on_color_id", using: :btree
  add_index "colors_items", ["item_id"], name: "index_colors_items_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.boolean  "available_in_store"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "items_sizes", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "size_id"
  end

  add_index "items_sizes", ["item_id"], name: "index_items_sizes_on_item_id", using: :btree
  add_index "items_sizes", ["size_id"], name: "index_items_sizes_on_size_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
