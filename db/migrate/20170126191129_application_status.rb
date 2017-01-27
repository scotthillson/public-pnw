class ApplicationStatus < ActiveRecord::Migration
  def change
    add_column :applications, :status, :string
    add_column :applications, :approved_by, :integer
  end
end
