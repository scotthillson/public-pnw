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

ActiveRecord::Schema.define(version: 20160413054001) do

  create_table "carpools", force: true do |t|
    t.string   "event"
    t.string   "address"
    t.string   "notes"
    t.time     "depart"
    t.time     "return"
    t.integer  "seats_offered"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.date     "event_date"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "discussion_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "discussions", force: true do |t|
    t.text     "body"
    t.string   "subject"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "category"
    t.string   "description"
    t.string   "expiration"
    t.string   "importance"
    t.string   "notes"
    t.string   "status"
    t.integer  "quantity"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "description"
    t.string   "category"
    t.string   "address"
    t.string   "weather"
    t.string   "notes"
    t.string   "miles"
    t.string   "name"
    t.string   "link"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: true do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "path"
    t.string   "type"
    t.string   "page"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "images", force: true do |t|
    t.string   "filename"
    t.string   "path"
    t.string   "page"
    t.string   "width"
    t.string   "height"
    t.integer  "rank"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "image"
    t.string   "image_big"
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.boolean  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", force: true do |t|
    t.date     "event_date"
    t.string   "description"
    t.string   "event"
    t.string   "notes"
    t.integer  "claimed_by"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "searches", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.string   "search_date"
    t.boolean  "active"
    t.integer  "creatd_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", force: true do |t|
    t.integer  "carpool_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "sponsor_url"
    t.string   "image"
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.string   "role",            default: "f"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",       default: false
  end

end
