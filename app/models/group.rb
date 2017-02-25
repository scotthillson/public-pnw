# A group is a local copy of D4H groups

class Group < ActiveRecord::Base
  
  def self.get_groups
    if DateTime.now.to_i - D4h.first.last_group_sync.to_i > 6
      D4h.offsetter('groups', method(:update_group))
      D4h.first.last_group_sync = DateTime.now
      D4h.first.save
    else
      true
    end
  end
  
  def self.update_group(remote_group)
    puts remote_group
    group = Group.find_by_d4h_id(remote_group["id"])
    group ||= new
    group.name = remote_group["title"]
    group.d4h_id = remote_group["id"]
    group.save
  end
  
end
