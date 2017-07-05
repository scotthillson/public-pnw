class MessageRoles < ActiveRecord::Migration
  def change
    add_column :messages, :role, :string
  end
end
