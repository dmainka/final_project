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

ActiveRecord::Schema.define(version: 20140313120053) do

  create_table "books", force: true do |t|
    t.integer  "product_id"
    t.string   "author"
    t.integer  "pages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    default: 1
    t.integer  "customer_id"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["remember_token"], name: "index_customers_on_remember_token"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.datetime "order_date"
    t.decimal  "total",           precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "ship_to_address"
    t.string   "payment_type"
  end

  create_table "products", force: true do |t|
    t.integer  "vendor_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",         precision: 8, scale: 2
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "songs", force: true do |t|
    t.integer  "product_id"
    t.string   "artist"
    t.string   "album"
    t.integer  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "snippet_url"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

end
