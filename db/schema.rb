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

ActiveRecord::Schema.define(version: 20141128061927) do

  create_table "invoice_products", force: true do |t|
    t.integer  "invoice_id"
    t.string   "name",                               null: false
    t.integer  "amount",                             null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_products", ["invoice_id"], name: "index_invoice_products_on_invoice_id", using: :btree

  create_table "invoices", force: true do |t|
    t.boolean  "received",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_products", force: true do |t|
    t.string   "type"
    t.integer  "list_id"
    t.integer  "product_id"
    t.integer  "amount",                             null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_products", ["list_id"], name: "index_list_products_on_list_id", using: :btree
  add_index "list_products", ["product_id"], name: "index_list_products_on_product_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "type"
    t.boolean  "done",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",                               null: false
    t.integer  "amount",                             null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_amount"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
