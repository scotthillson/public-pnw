class ProspectApplicationId < ActiveRecord::Migration
  def change
    add_column :prospect_applications, :client_ip, :string
  end
end
