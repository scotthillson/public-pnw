# An activity is a local copy of D4H activity/incident/events

class Activity < ActiveRecord::Base
  
  has_one :event
  
  def self.get_activities
    if DateTime.now.to_i - D4h.first.last_activity_sync.to_i > 2000
      D4h.offsetter('activities', method(:update_activity))
      track = D4h.first
      track.last_activity_sync = DateTime.now
      track.save
    end
  end
  
  def self.update_activity(remote_activity)
    activity = Activity.find_by_d4h_id remote_activity["id"]
    activity ||= new
    activity.d4h_id = remote_activity["id"]
    activity.reference = remote_activity["ref"]
    activity.description = remote_activity["description"]
    activity.start_on = remote_activity["date"]
    activity.save
  end
  
end
