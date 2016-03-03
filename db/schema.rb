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

ActiveRecord::Schema.define(version: 20160303181623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment_text"
    t.integer  "recipe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "ingredients"
    t.text     "method"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo_id"
    t.integer  "view_count",  default: 0
    t.integer  "category_id"
  end

  create_table "refile_attachments", force: :cascade do |t|
    t.string "namespace", null: false
  end

  add_index "refile_attachments", ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree

end
