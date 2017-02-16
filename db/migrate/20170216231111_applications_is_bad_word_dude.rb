class ApplicationsIsBadWordDude < ActiveRecord::Migration
  def change
    rename_table :applications, :prospect_applications
  end
end
