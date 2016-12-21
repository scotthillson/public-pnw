class D4h
  
  def self.get_incidents(offset)
    HTTParty.get("https://api.d4h.org/v2/team/incidents?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
  def self.get_members(offset)
    HTTParty.get("https://api.d4h.org/v2/team/members?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
end
