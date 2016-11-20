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

ActiveRecord::Schema.define(version: 20161120185511) do

  create_table "branches", force: :cascade do |t|
    t.string "name"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "companyname"
    t.date     "date"
    t.string   "location"
    t.float    "package"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
  end

  create_table "company_branches", force: :cascade do |t|
    t.integer "company_id"
    t.integer "branch_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like"
    t.integer "user_id"
    t.integer "company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "phone"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "branch_id"
  end

end
