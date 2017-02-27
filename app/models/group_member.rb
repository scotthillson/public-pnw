class GroupMember < ActiveRecord::Base

  belongs_to :member

  def self.get_members(group)
    member_ids = group.group_members.pluck(:member_id)
    result = D4h.get_group(group.d4h_id)
    return unless result["statusCode"] == 200
    remote_members = result["data"]["members"]
    remote_members.each do |remote_member|
      member = Member.find_by_d4h_id(remote_member)
      member_ids.delete(member.id)
      update_group_members(group, member, remote_member)
    end
    where(member_id: member_ids).destroy_all
  end

  def self.update_group_members(group, member, remote_member)
    group_member = GroupMember.find_by(group_id: group.id, member_id: member.id)
    group_member ||= new
    group_member.group_id = group.id
    group_member.member_id = member.id
    group_member.save
  end

end
