class ChangeCarpoolDates < ActiveRecord::Migration
  def change
    add_column :carpools, :event_date, :date
    change_column :carpools, :depart, :time
    change_column :carpools, :return, :time
  end
end
