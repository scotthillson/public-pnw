# An activity is a local copy of D4H a activity/incident/event/exercise

class Activity < ActiveRecord::Base

  has_one :event

  def self.get_activities
    track = D4h.first
    track.get_activities
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
    start_on = Time.at(remote_activity['date'].to_s[0..9].to_i)
    end_on = Time.at(remote_activity['enddate'].to_s[0..9].to_i)
    activity.start_on = start_on
    activity.end_on = end_on
    activity.save
    Attendance.get_attendance(activity)
  end

end
