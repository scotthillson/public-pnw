class FixSponsorUrl < ActiveRecord::Migration
  def change
    rename_column :sponsors, :sponsor_link, :sponsor_url
  end
end
