class ImagesAndForms < ActiveRecord::Migration
  def change
    create_table :images, force: true do |t|
      t.string   "filename"
      t.string   "path"
      t.string   "type"
      t.string   "page"
      t.integer  "rank"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :forms, force: true do |t|
      t.string   "name"
      t.string   "filename"
      t.string   "path"
      t.string   "type"
      t.string   "page"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
  end
end
