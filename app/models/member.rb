class Member < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :mobile_phone
  
  def create_authorization_code
    MobileAuthorization.new_authorization(self)
  end
  
  def ingest_authoriation_code
  end
  
  def self.big_sync
    offset = 0
    status_code = 200
    while status_code == 200
      result = D4h.get_members(offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      big_update(data)
      offset += 20
    end
  end
  
  def self.fast_sync
    offset = 0
    status_code = 200
    processed_rows = []
    while status_code == 200
      result = D4h.get_members(offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      data.each do |member|
        if !processed_rows.include? member["id"]
          fast_update(member)
          processed_rows.push member["id"]
        end
      end
      offset += 20
    end
  end
  
  def self.fast_update(remote_member)
    member = Member.find_by_d4h_id(remote_member["id"])
    member.update(on_call: remote_member["on_call"], status_id: remote_member["status"]["id"]) if member
  end
  
  def self.big_update(results)
    results.each do |remote_member|
      member = Member.find_by_d4h_id(remote_member["id"])
      if member
        member.name = remote_member["name"]
        member.address = remote_member["address"]
        member.d4h_id = remote_member["id"]
        member.email = remote_member["email"]
        member.home_phone = remote_member["homephone"]
        member.mobile_phone = remote_member["mobilephone"]
        member.on_call = remote_member["on_call"]
        member.reference = remote_member["ref"]
        member.status_id = remote_member["status"]["id"]
        member.work_phone = remote_member["workphone"]
        member.save
      else
        member = new
        member.name = remote_member["name"]
        member.address = remote_member["address"]
        member.d4h_id = remote_member["id"]
        member.email = remote_member["email"]
        member.home_phone = remote_member["homephone"]
        member.mobile_phone = remote_member["mobilephone"]
        member.on_call = remote_member["on_call"]
        member.reference = remote_member["ref"]
        member.status_id = remote_member["status"]["id"]
        member.work_phone = remote_member["workphone"]
        member.save
      end
    end
  end
  
end
