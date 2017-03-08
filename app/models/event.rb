# An event is an activity that has been added to the calendar.

class Event < ActiveRecord::Base

  belongs_to :activity
  belongs_to :user, foreign_key: :created_by

  scope :incidents, -> { where(event_type: 'incident') }

end
