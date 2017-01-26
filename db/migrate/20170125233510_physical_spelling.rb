class PhysicalSpelling < ActiveRecord::Migration
  def change
    rename_column :applications, :phyiscal_shape, :physical_shape
  end
end
