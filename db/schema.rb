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

ActiveRecord::Schema.define(version: 20150427080912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.money    "balance",    scale: 2, default: 0.0,     null: false
    t.string   "currency",             default: "euros", null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "credits", force: :cascade do |t|
    t.integer  "account_id"
    t.money    "amount",              scale: 2
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "emitting_account_id"
    t.money    "account_balance",     scale: 2
  end

  add_index "credits", ["account_id"], name: "index_credits_on_account_id", using: :btree

  create_table "debits", force: :cascade do |t|
    t.integer  "account_id"
    t.money    "amount",               scale: 2
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "receiving_account_id"
    t.money    "account_balance",      scale: 2
  end

  add_index "debits", ["account_id"], name: "index_debits_on_account_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "deposits", force: :cascade do |t|
    t.integer  "account_id"
    t.money    "account_balance", scale: 2
    t.money    "amount",          scale: 2
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "deposits", ["account_id"], name: "index_deposits_on_account_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "operation_id"
    t.string   "operation_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree
  add_index "transactions", ["operation_id"], name: "index_transactions_on_operation_id", using: :btree
  add_index "transactions", ["operation_type"], name: "index_transactions_on_operation_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "name",                           null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "accounts", "users"
  add_foreign_key "credits", "accounts"
  add_foreign_key "debits", "accounts"
  add_foreign_key "deposits", "accounts"
  add_foreign_key "transactions", "accounts"
end
