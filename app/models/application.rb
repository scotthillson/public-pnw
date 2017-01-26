class Application < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :birthday
  validates_presence_of :mobile_phone
  validates_presence_of :home_phone
  validates_presence_of :work_phone
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :address_state
  validates_presence_of :postal
  validates_presence_of :employer
  validates_presence_of :job
  validates_presence_of :emergency_one
  validates_presence_of :emergency_phone_one
  validates_presence_of :emergency_relationship_one
  validates_presence_of :emergency_two
  validates_presence_of :emergency_phone_two
  validates_presence_of :emergency_relationship_two
  validates_presence_of :reference_one
  validates_presence_of :reference_phone_one
  validates_presence_of :reference_address_one
  validates_presence_of :reference_city_one
  validates_presence_of :reference_state_one
  validates_presence_of :reference_postal_one
  validates_presence_of :reference_two
  validates_presence_of :reference_phone_two
  validates_presence_of :reference_address_two
  validates_presence_of :reference_city_two
  validates_presence_of :reference_state_two
  validates_presence_of :reference_postal_two
  validates_presence_of :reference_three
  validates_presence_of :reference_phone_three
  validates_presence_of :reference_address_three
  validates_presence_of :reference_city_three
  validates_presence_of :reference_state_three
  validates_presence_of :reference_postal_three
  validates_presence_of :primary_reason
  
end
