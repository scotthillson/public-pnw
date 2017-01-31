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
      t.text     :explain_physical
      t.boolean  :first_aid
      t.string   :first_aid_issued
      t.string   :certifications
      t.string   :special_skills
      t.boolean  :license
      t.boolean  :felony
      t.boolean  :felony_conviction
      t.text     :primary_reason
      t.boolean  :liability
      t.boolean  :acknowledge
      t.datetime :photo_taken_at
      t.datetime :waiver_signed_at
      t.datetime :dues_paid_at
      t.datetime :approved_at
      t.datetime :d4h
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
      t.integer  :group_id
      t.integer  :member_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :incidents, force: true do |t|
      t.integer  :d4h_id
      t.string   :reference
      t.text     :description
      t.string   :lat
      t.string   :lng
      t.integer  :attendance_percent
      t.integer  :attendance
      t.integer  :distance
      t.datetime :end_on
      t.datetime :start_on
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_column :members, :application_id, :integer
    add_column :members, :status_id, :integer
    add_column :members, :on_call, :boolean
    add_column :members, :d4h_id, :integer
    add_column :members, :reference, :string
    add_column :members, :birthday, :date
    add_column :members, :mobile_phone, :string
    add_column :members, :home_phone, :string
    add_column :members, :work_phone, :string
    add_column :members, :address, :string
    add_column :members, :city, :string
    add_column :members, :state, :string
    add_column :members, :zip, :string
    add_column :members, :emergency_one, :string
    add_column :members, :emergency_phone_one, :string
    add_column :members, :emergency_relationship_one, :string
    add_column :members, :emergency_two, :string
    add_column :members, :emergency_phone_two, :string
    add_column :members, :emergency_relationship_two, :string
    
  end
end
