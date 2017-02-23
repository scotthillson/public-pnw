# An event is the sister of D4H activities

class Event < ActiveRecord::Base
  
  belongs_to :activity
  belongs_to :user, foreign_key: :created_by
  
  scope :incidents, -> {where(event_type: 'incident')}
  
end
