class MemberPositions < ActiveRecord::Migration
  def change
    add_column :members, :position, :string
    add_column :members, :duty_start, :datetime
    add_column :members, :duty_end, :datetime
    add_column :members, :team_id, :integer
    add_column :members, :duty_type, :integer
  end
end
