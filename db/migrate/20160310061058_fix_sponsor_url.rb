class FixSponsorUrl < ActiveRecord::Migration
  def change
    rename_column :sponsors, :sponsor_link, :sponsor_url if column_exists? :sponsors, :sponsor_link
    rename_column :sponsors, :link, :sponsor_url if column_exists? :sponsors, :link
  end
end
