class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :string
      t.string :author
      t.string :body
      t.string :search_date

      t.timestamps
    end
  end
end
