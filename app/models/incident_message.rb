class IncidentMessage < ActiveRecord::Base

  has_many :incidents
  has_many :meessages

end
