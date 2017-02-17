class HowDoWeNotHaveEvents < ActiveRecord::Migration
  def change
    add_column :events, :reference, :string
    add_column :events, :lat, :string
    add_column :events, :lng, :string
    add_column :events, :start_on, :datetime
    add_column :events, :end_on, :datetime
    add_column :events, :activity_id, :integer
  end
end
