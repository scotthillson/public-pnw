class PostalStuff < ActiveRecord::Migration
  def change
    rename_column :applications, :zip, :postal
    rename_column :applications, :state, :address_state
    rename_column :applications, :reference_zip_one, :reference_postal_one
    rename_column :applications, :reference_zip_two, :reference_postal_two
    rename_column :applications, :reference_zip_three, :reference_postal_three
  end
end
