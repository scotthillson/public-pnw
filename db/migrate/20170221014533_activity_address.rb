class ActivityAddress < ActiveRecord::Migration
  def change
    add_column :activities, :gridref, :string
    add_column :activities, :address, :string
    add_column :activities, :city, :string
    add_column :activities, :state, :string
    add_column :activities, :zip, :string
    add_column :activities, :country, :string
    add_column :activities, :type, :string
    add_column :events, :gridref, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :zip, :string
    add_column :events, :country, :string
    add_column :events, :type, :string
  end
end
