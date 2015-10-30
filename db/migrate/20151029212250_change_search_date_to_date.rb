class ChangeSearchDateToDate < ActiveRecord::Migration
  def change
    change_column :searches, :search_date, :date
  end
end
