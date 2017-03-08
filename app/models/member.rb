# A member is a local copy of D4H team memmbers

class Member < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :mobile_phone

  has_many :messages, foreign_key: :from, primary_key: :mobile_phone

  def create_authorization_code
    MobileAuthorization.new_authorization(self)
  end

  def ingest_authorization_code
    # what was I doing here?
  end

  def self.get_members
    if DateTime.now.to_i - D4h.first.last_member_sync.to_i > 999
      D4h.offsetter('members', method(:update_member), method(:sync_members))
      track = D4h.first
      track.last_member_sync = DateTime.now
      track.save
    else
      true
    end
  end

  def self.update_member(remote_member)
    member = find_by_d4h_id(remote_member["id"])
    member ||= new
    member.name = remote_member["name"]
    member.address = remote_member["address"]
    member.d4h_id = remote_member["id"]
    member.duty_end = remote_member["duty_end"]
    member.duty_start = remote_member["duty_start"]
    member.duty_type = remote_member["duty_type"]
    member.email = remote_member["email"]
    member.home_phone = remote_member["homephone"]
    member.mobile_phone = remote_member["mobilephone"]
    member.on_call = remote_member["on_call"]
    member.position = remote_member["position"]
    member.reference = remote_member["ref"]
    member.status_id = remote_member["status"]["id"]
    member_team_id = remote_member["team_id"]
    member.work_phone = remote_member["workphone"]
    member.save
  end

  def self.sync_members(ids)
    where(d4h_id: (all.pluck(:d4h_id) - ids)).update_all(d4h_id: null)
  end

  def self.sync_with_users
    where(statud_is: 1).each do |member|
      unless User.where(email: member.email)
        user = User.new(email: member.email.downcase, name: member.name)
        user.save
      end
    end
  end

end
