class Incident < ActiveRecord::Base
  
  has_many :members, through: :incident_members
  
end
