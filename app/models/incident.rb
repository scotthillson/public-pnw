# An incident is strictly a pnwsar.org admin-facing resource used for callouts.

class Incident < ActiveRecord::Base
  
  has_many :members, through: :incident_members
  
end
