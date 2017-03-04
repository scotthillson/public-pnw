class TimeForCustomGroups < ActiveRecord::Migration
  def change
    add_column :groups, :local_name, :string
    add_column :equipment, :updated_by, :integer
  end
end
