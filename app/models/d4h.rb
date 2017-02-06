class D4h
  
  def self.get_incidents(offset)
    HTTParty.get("https://api.d4h.org/v2/team/incidents?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
  def self.get_members(offset)
    HTTParty.get("https://api.d4h.org/v2/team/members?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
  def self.get_member(id)
    HTTParty.get("https://api.d4h.org/v2/team/members/#{id}?access_token=#{Rails.application.secrets.D4H}")
  end
  
  def self.get_groups(offset)
    HTTParty.get("https://api.d4h.org/v2/team/groups?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
  def self.get_group(id)
    HTTParty.get("https://api.d4h.org/v2/team/groups/#{id}?access_token=#{Rails.application.secrets.D4H}")
  end
  
end
