class Activity < ActiveRecord::Base
  
  def self.sync
    offset = 450
    status_code = 200
    while status_code == 200
      result = D4h.get_incidents(offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      parse_api_results(data)
      offset += 20
    end
  end
  
  def self.parse_api_results(results)
    results.each do |remote_activity|
      local_row = Activity.find_by_d4H_id remote_activity["id"]
      if local_row
      else
      end
    end
  end
  
end
