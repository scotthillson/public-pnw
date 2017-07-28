class MessageUuid < ActiveRecord::Migration
  def change
    add_column :messages, :uuid, :string
    add_column :prospect_applications, :last_name, :string
    rename_column :prospect_applications, :name, :first_name
  end
end
