class MeetingsContactDonateJoinAboutQuestions < ActiveRecord::Migration
  def change
    add_column :pages, :active, :boolean
    add_column :members, :active, :boolean
    create_table :homes, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :title
      t.string   :subtitle
      t.string   :paragraph_one
      t.string   :paragraph_two
      t.string   :paragraph_three
      t.string   :paragraph_four
      t.string   :image_one
      t.string   :image_two
      t.string   :image_three
      t.timestamps
    end
    create_table :joins, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.timestamps
    end
    create_table :donations, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :body
      t.timestamps
    end
    create_table :abouts, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :body
      t.timestamps
    end
    create_table :contacts, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :body
      t.timestamps
    end
    create_table :questions, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :body
      t.timestamps
    end
    create_table :meetings, force: true do |t|
      t.string   :created_by
      t.boolean  :active
      t.string   :name
      t.string   :body
      t.timestamps
    end
    create_Table :photos, force: true do |t|
      t.string   :created_by
      t.strting  :filename
      t.string   :filepath
      t.timestamps
    end
  end
end
