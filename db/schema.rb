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

ActiveRecord::Schema.define(version: 20160126071448) do

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

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.boolean  "admin",           default: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",       default: false
  end

end
