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

ActiveRecord::Schema.define(version: 20160616202440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "priorities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  add_index "sub_categories", ["user_id"], name: "index_sub_categories_on_user_id", using: :btree

  create_table "supports", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sub_categories_id"
    t.integer  "priority_id"
    t.boolean  "state"
    t.integer  "user_id"
    t.string   "screen"
  end

  add_index "supports", ["priority_id"], name: "index_supports_on_priority_id", using: :btree
  add_index "supports", ["sub_categories_id"], name: "index_supports_on_sub_categories_id", using: :btree
  add_index "supports", ["user_id"], name: "index_supports_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "users"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "sub_categories", "users"
  add_foreign_key "supports", "priorities"
  add_foreign_key "supports", "users"
end
