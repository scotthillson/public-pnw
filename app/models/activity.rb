# An activity is a local copy of D4H a activity/incident/event/exercise

class Activity < ActiveRecord::Base

  has_one :event

  def self.get_activities
    if DateTime.now.to_i - D4h.first.last_activity_sync.to_i > 3600
      D4h.offsetter('activities', method(:update_activity))
      track = D4h.first
      track.last_activity_sync = DateTime.now
      track.save
    end
  end

  def self.update_activity(remote_activity)
    activity = Activity.find_by_d4h_id remote_activity['id']
    activity ||= new
    activity.d4h_id = remote_activity['id']
    activity.lat = remote_activity['lat']
    activity.lng = remote_activity['lng']
    activity.gridref = remote_activity['gridref']
    activity.address = remote_activity['streetaddress']
    activity.city = remote_activity['townaddress']
    activity.state = remote_activity['regionaddress']
    activity.zip = remote_activity['postcodeaddress']
    activity.country = remote_activity['countryaddress']
    activity.activity_type = remote_activity['activity']
    activity.reference = remote_activity['ref']
    activity.description = remote_activity['description']
    activity.start_on = remote_activity['date']
    activity.end_on = remote_activity['enddate']
    activity.save
  end

end
