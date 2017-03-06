class PutThatCrapToRest < ActiveRecord::Migration
  def change
    drop_table :searches
    add_column(:posts, :created_by, :integer) unless Post.column_names.include?(:created_by)
    remove_column(:posts, :author, :string)
    change_column(:pages, :created_by, :integer)
    add_column(:pages, :updated_by, :integer) unless Page.column_names.include?(:updated_by)
    remove_column(:members, :created_by, :integer)
    remove_column(:prospect_applications, :creatd_by)
    remove_column(:prospect_applications, :created_by)
  end
end
