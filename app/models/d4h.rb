class D4h < ActiveRecord::Base

  HEADERS = { "Authorization" => "Bearer #{Rails.application.secrets.D4H}" }

  def get_activities
    if DateTime.now.to_i - last_activity_sync.to_i > 36000
      activities_offsetter
      self.last_activity_sync = DateTime.now
      self.save
    end
  end

  handle_asynchronously :get_activities

  def activities_offsetter
    offset = 1000
    status_code = 200
    processed_rows = []
    while status_code == 200
      result = HTTParty.get(
        "https://api.d4h.org/v2/team/activities?offset=#{offset}",
        headers: HEADERS
      )
      status_code = result['statusCode']
      data = result['data']
      if !data || data.length < 1
        return
      end
      data.each do |row|
        if !processed_rows.include? row['id']
          Activity.update_activity(row)
          processed_rows.push row['id']
        end
      end
      offset += 20
    end
  end


  def self.offsetter(resource, callback, finish=nil)
    offset = 0
    status_code = 200
    processed_rows = []
    while status_code == 200
      result = get_resources(resource, offset)
      status_code = result['statusCode']
      data = result['data']
      if data.length < 1
        finish.call(processed_rows) if finish
        return
      end
      data.each do |row|
        if !processed_rows.include? row['id']
          callback.call(row)
          processed_rows.push row['id']
        end
      end
      offset += 20
    end
    finish.call(processed_rows) if finish
  end

  def self.get_resources(resource, offset)
    HTTParty.get(
      "https://api.d4h.org/v2/team/#{resource}?offset=#{offset}",
      headers: HEADERS
    )
  end

  def self.get_member(id)
    HTTParty.get(
      "https://api.d4h.org/v2/team/members/#{id}",
      headers: HEADERS
    )
  end

  def self.get_group(id)
    HTTParty.get(
      "https://api.d4h.org/v2/team/groups/#{id}",
      headers: HEADERS
    )
  end

  def self.get_attendance(activity_id)
    HTTParty.get(
      "https://api.d4h.org/v2/team/attendance?activity_id=#{activity_id}",
      headers: HEADERS
    )
  end

end
