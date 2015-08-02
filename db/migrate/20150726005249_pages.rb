class Pages < ActiveRecord::Migration
  def change
    create_table :pages, force: true do |t|
      t.string   :created_by
      t.string   :name
      t.string   :body
      t.timestamps
    end
  end
end
