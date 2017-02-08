class D4h < ActiveRecord::Base
  
  def self.offsetter(resource, callback)
    offset = 0
    status_code = 200
    processed_rows = []
    while status_code == 200
      result = get_resources(resource, offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      data.each do |row|
        if !processed_rows.include? row["id"]
          puts "--#{row}--"
          callback.call(row)
          processed_rows.push row["id"]
        end
      end
      offset += 20
    end
  end
  
  def self.get_resources(resource, offset)
    HTTParty.get("https://api.d4h.org/v2/team/#{resource}?access_token=#{Rails.application.secrets.D4H}&offset=#{offset}")
  end
  
  def self.get_member(id)
    HTTParty.get("https://api.d4h.org/v2/team/members/#{id}?access_token=#{Rails.application.secrets.D4H}")
  end
  
  def self.get_group(id)
    HTTParty.get("https://api.d4h.org/v2/team/groups/#{id}?access_token=#{Rails.application.secrets.D4H}")
  end
  
end
