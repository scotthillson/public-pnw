# Attendance is a local copy of D4H attendance

class Attendance < ActiveRecord::Base

  belongs_to :activity
  belongs_to :member

  def self.get_attendance(activity)
    activity_id = activity.d4h_id
    result = D4h.get_attendance(activity_id)
    return unless result["statusCode"] == 200
    result["data"].each do |remote_attendance|
      update_attendance(remote_attendance,activity)
    end
  end

  def self.update_attendance(remote_attendance, activity)
    att = Attendance.find_by_d4h_id(remote_attendance['id'])
    att ||= new
    att.activity_id = activity.id
    member = Member.find_by_d4h_id(remote_attendance['member']['id'])
    return unless member
    att.member_id = member.id
    att.d4h_id = remote_attendance['id']
    att.status = remote_attendance['status']
    att.duration = remote_attendance['duration']
    att.start_on = remote_attendance['date']
    att.end_on = remote_attendance['enddate']
    att.role = remote_attendance['role']
    att.save
  end

end
