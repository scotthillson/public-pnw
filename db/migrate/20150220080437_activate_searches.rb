class ActivateSearches < ActiveRecord::Migration
  def change
    add_column :searches, :active, :boolean
  end
end
