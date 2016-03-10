class ImagesAndForms < ActiveRecord::Migration
  def change
    if !table_exists? :images
      create_table :images, force: true do |t|
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
    end
    if !table_exists? :forms
      create_table :forms do |t|
        t.string   "name"
        t.string   "filename"
        t.string   "path"
        t.string   "page"
        t.integer  "created_by"
        t.datetime "updated_at"
        t.datetime "created_at"
      end
    end
    if !table_exists? :members
      create_table :members, force: true do |t|
        t.string   "name"
        t.string   "title"
        t.string   "image"
        t.string   "image_big"
        t.integer  "created_by"
        t.datetime "created_at"
      end
    end
    if !table_exists? :pages
      create_table :pages, force: true do |t|
        t.string   "name"
        t.string   "body"
        t.integer  "active"
        t.integer  "created_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end
    end
    if !table_exists? :posts
      create_table :posts, force: true do |t|
        t.string   "title"
        t.string   "author"
        t.string   "body"
        t.boolean  "active"
        t.integer  "created_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end
    end
    if !table_exists? :searches
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
    end
    if !table_exists? :users
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
  end
end
