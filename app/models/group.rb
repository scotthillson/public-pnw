class Group < ActiveRecord::Base
  
  def self.get_groups
    offset = 0
    status_code = 200
    processed_rows = []
    while status_code == 200
      result = D4h.get_groups(offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      data.each do |group|
        if !processed_rows.include? group["id"]
          puts group
          processed_rows.push group["id"]
        end
      end
      offset += 20
    end
  end
  
  def self.big_update(results)
    results.each do |remote_group|
      group = Group.find_by_d4h_id(remote_group["id"])
      if group
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
      else
        create_group(remote_group)
      end
    end
  end
  
  def self.create_group(group)
    group = new
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
