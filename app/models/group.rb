# A group is a local copy of D4H groups

class Group < ActiveRecord::Base
  
  def self.get_groups
    if DateTime.now - D4h.first.last_group_sync > 6000
      D4h.offsetter('groups', method(:update_group))
      D4h.first.last_goup_sync = DateTime.now
      D4h.first.save
    end
  end
  
  def self.update_group(remote_group)
    group = Group.find_by_d4h_id(remote_group["id"])
    group ||= new
    group.name = remote_group["name"]
    group.address = remote_group["address"]
    group.d4h_id = remote_group["id"]
    group.email = remote_group["email"]
    group.home_phone = remote_group["homephone"]
    group.mobile_phone = remote_group["mobilephone"]
    group.on_call = remote_group["on_call"]
    group.reference = remote_group["ref"]
    group.status_id = remote_group["status"]["id"]
    group.work_phone = remote_group["workphone"]
    group.save
  end
  
end
