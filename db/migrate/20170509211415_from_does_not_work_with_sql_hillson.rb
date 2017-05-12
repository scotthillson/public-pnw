class FromDoesNotWorkWithSqlHillson < ActiveRecord::Migration
  def change
    rename_column :messages, :from, :from_phone
    rename_column :messages, :to, :to_phone
  end
end
