class DefualtFirstAidKit < ActiveRecord::Migration
  def change
    add_column :groups, :first_aid_kit, :boolean
  end
end
