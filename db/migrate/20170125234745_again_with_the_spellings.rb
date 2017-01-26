class AgainWithTheSpellings < ActiveRecord::Migration
  def change
    rename_column :applications, :reference_phtwo_two, :reference_phone_two
    rename_column :applications, :reference_phthree_three, :reference_phone_three
  end
end
