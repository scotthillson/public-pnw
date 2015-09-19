# encoding: UTF-8
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).

ActiveRecord::Schema.define(version: 20150726005249) do

  create_table :members, force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "image"
    t.string   "image_big"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table :pages, force: true do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "active"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table :posts, force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table :searches, force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.string   "search_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table :users, force: true do |t|
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
