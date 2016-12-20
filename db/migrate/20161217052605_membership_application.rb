class MembershipApplication < ActiveRecord::Migration
  def change
    
    create_table :applications, force: true do |t|
      t.string   :name
      t.string   :email
      t.date     :birthday
      t.string   :mobile_phone
      t.string   :home_phone
      t.string   :work_phone
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zip
      t.string   :employer
      t.string   :job
      t.string   :emergency_one
      t.string   :emergency_phone_one
      t.string   :emergency_relationship_one
      t.string   :emergency_two
      t.string   :emergency_phone_two
      t.string   :emergency_relationship_two
      t.string   :reference_one
      t.string   :reference_phone_one
      t.string   :reference_address_one
      t.string   :reference_city_one
      t.string   :reference_state_one
      t.string   :reference_zip_one
      t.string   :reference_two
      t.string   :reference_phtwo_two
      t.string   :reference_address_two
      t.string   :reference_city_two
      t.string   :reference_state_two
      t.string   :reference_zip_two
      t.string   :reference_three
      t.string   :reference_phthree_three
      t.string   :reference_address_three
      t.string   :reference_city_three
      t.string   :reference_state_three
      t.string   :reference_zip_three
      t.boolean  :phyiscal_shape
      t.string   :explain_physical
      t.boolean  :first_aid
      t.string   :first_aid_issued
      t.string   :certifications
      t.string   :special_skills
      t.boolean  :license
      t.boolean  :felony
      t.boolean  :felony_conviction
      t.string   :primary_reason
      t.boolean  :liability
      t.boolean  :acknowledge
      t.datetime :photo_taken
      t.datetime :waiver
      t.datetime :dues_paid
      t.datetime :approved
      t.datetime :decisions
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :vacations, force: true do |t|
      t.string   :repeats
      t.string   :notes
      t.integer  :member_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :groups, foce: true do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :group_members, force: true do |t|
      group_id   :integer
      member_id  :integer
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_column :members, :application_id, :integer
    add_column :members, :operational, :boolean
    
  end
end
