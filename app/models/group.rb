# A group is a local copy of D4H groups

class Group < ActiveRecord::Base

  has_many :group_members
  has_many :members, through: :group_members

  def self.get_groups
    if DateTime.now.to_i - D4h.first.last_group_sync.to_i > 999
      D4h.offsetter('groups', method(:update_group))
      track = D4h.first
      track.last_group_sync = DateTime.now
      track.save
    else
      true
    end
  end

  def self.update_group(remote_group)
    group = Group.find_by_d4h_id(remote_group["id"])
    group ||= new
    group.d4h_id = remote_group["id"]
    group.name = remote_group["title"]
    if group.save
      GroupMember.get_members(group)
    end
  end

end
