
ActiveRecord::Schema.define(version: 20151029212250) do
  
  create_table :members, force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "image"
    t.string   "image_big"
    t.integer  "created_by"
    t.datetime "created_at"
  end
  
  create_table :pages, force: true do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table :posts, force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.boolean  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table :searches, force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.string   "search_date"
    t.boolean  "active"
    t.integer  "creatd_by"
    t.datetime "created_at"
    t.datetime "updated_at"
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
