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

ActiveRecord::Schema.define(version: 20160614044039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text   "message"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "order_id"
    t.string   "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders_properties", ["order_id"], name: "index_orders_properties_on_order_id", using: :btree
  add_index "orders_properties", ["property_id"], name: "index_orders_properties_on_property_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "category_id"
    t.string   "status",                      default: "active"
    t.string   "property_image_file_name"
    t.string   "property_image_content_type"
    t.integer  "property_image_file_size"
    t.datetime "property_image_updated_at"
  end

  add_index "properties", ["category_id"], name: "index_properties_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role"
  end

  add_foreign_key "orders", "users"
  add_foreign_key "orders_properties", "orders"
  add_foreign_key "orders_properties", "properties"
  add_foreign_key "properties", "categories"
end
