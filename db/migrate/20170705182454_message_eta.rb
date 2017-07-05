class MessageEta < ActiveRecord::Migration
  def change
    add_column :messages, :eta, :datetime
  end
end
