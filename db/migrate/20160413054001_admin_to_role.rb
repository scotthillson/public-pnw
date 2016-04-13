class AdminToRole < ActiveRecord::Migration
  def change
    rename_column :users, :admin, :role
    change_column :users, :role, :string
  end
end
