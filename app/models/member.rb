class Member < ActiveRecord::Base
  
  validates_presence_of :image
  validates_presence_of :mobile_number
  validates_presence_of :name
  validates_presence_of :title
  
  def create_authorization_code
    MobileAuthorization.new_authorization(self)
  end
  
  def ingest_authoriation_code
  end
  
end
