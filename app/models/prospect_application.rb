class ProspectApplication < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
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

  def self.csv_export
    CSV.generate do |csv|
      csv << [
        'First Name',
        'Last Name',
        'Birthday',
        'Email',
        'Mobile',
        'Home',
        'Work',
        'Address',
        'City',
        'State',
        'Postal',
        'Employer',
        'Job Title',
        'Emergency Contact',
        'Emergency Phone',
        'Emergency Relationship',
        'Emergency Contact 2',
        'Emergency Phone 2',
        'Emergency Relationship 2',
        'Reference',
        'Reference Phone',
        'Reference Address',
        'Reference City',
        'Reference State',
        'Reference Postal',
        'Reference 2',
        'Reference Phone 2',
        'Reference Address 2',
        'Reference City 2',
        'Reference State 2',
        'Reference Postal 2',
        'Reference 3',
        'Reference Phone 3',
        'Reference Address 3',
        'Reference City 3',
        'Reference State 3',
        'Reference Postal 3',
        'Physical',
        'Physical Explanation',
        'First Aid',
        'First Aid Issuer',
        'Certifications',
        'Drivers License',
        'Felony',
        'Felony Conviction',
        'Reason',
        'Liability',
        'Agreement',
        'Application Approved',
        'Waiver Signed',
        'Dues Paid',
        'Photo Taken',
        'D4H created',
        'Date Submitted'
      ]
      ProspectApplication.all.each do |r|
        row = []
        row << r.first_name
        row << r.last_name
        row << r.email
        row << r.birthday
        row << r.mobile_phone
        row << r.home_phone
        row << r.work_phone
        row << r.address
        row << r.city
        row << r.address_state
        row << r.postal
        row << r.employer
        row << r.job
        row << r.emergency_one
        row << r.emergency_phone_one
        row << r.emergency_relationship_one
        row << r.emergency_two
        row << r.emergency_phone_two
        row << r.emergency_relationship_two
        row << r.reference_one
        row << r.reference_phone_one
        row << r.reference_address_one
        row << r.reference_city_one
        row << r.reference_state_one
        row << r.reference_postal_one
        row << r.reference_two
        row << r.reference_phone_two
        row << r.reference_address_two
        row << r.reference_city_two
        row << r.reference_state_two
        row << r.reference_postal_two
        row << r.reference_three
        row << r.reference_phone_three
        row << r.reference_address_three
        row << r.reference_city_three
        row << r.reference_state_three
        row << r.reference_postal_three
        row << r.physical_shape
        row << r.explain_physical
        row << r.first_aid
        row << r.first_aid_issued
        row << r.certifications
        row << r.license
        row << r.felony
        row << r.felony_conviction
        row << r.primary_reason
        row << r.liability
        row << r.acknowledge
        row << r.approved_at
        row << r.waiver_signed_at
        row << r.dues_paid_at
        row << r.photo_taken_at
        row << r.d4h
        row << r.created_at
        csv << row
      end
    end
  end

end
