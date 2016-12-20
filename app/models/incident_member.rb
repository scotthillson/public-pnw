class IncidentMember < ActiveRecord::Base
  
  has_many :incidents
  has_many :members
  
end
