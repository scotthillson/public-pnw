# An event is the sister of D4H activities

class Event < ActiveRecord::Base
  
  belongs_to :activity
  
end
