class TaskBook < ActiveRecord::Migration
  def change
    create_table :tasks, force: true do |t|
      t.string   :description
      t.string   :display_name
      t.integer  :task_book_id
      t.integer  :user_id
      t.integer  :instructor_id
      t.date     :date_completed
      t.datetime :updated_at
      t.datetime :created_at
    end
    create_table :task_books, force: true do |t|
      t.string   :name
      t.string   :desription
      t.date     :date_started
      t.date     :date_due
      t.date     :date_completed
      t.integer  :group_id
      t.integer  :updated_by
      t.integer  :created_by
      t.datetime :updated_at
      t.datetime :created_at
    end
  end
end
