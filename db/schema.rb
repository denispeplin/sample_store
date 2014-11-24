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

ActiveRecord::Schema.define(version: 20141124093635) do

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

  create_table "products", force: true do |t|
    t.string   "name",       null: false
    t.string   "amount",     null: false
    t.string   "price",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
