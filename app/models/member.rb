class Member < ActiveRecord::Base
  
  validates_presence_of :image
  validates_presence_of :mobile_number
  validates_presence_of :name
  validates_presence_of :title
  
  def create_authorization_code
    MobileAuthorization.new_authorization(self)
  end
  
  def ingest_authoriation_code
  end
  
  def self.sync
    offset = 450
    status_code = 200
    while status_code == 200
      result = D4h.get_incidents(offset)
      status_code = result["statusCode"]
      data = result["data"]
      return if data.length < 1
      data[0].each { |k,v| puts "#{k} #{v}" }
      return
      parse_api_results(data)
      offset += 20
    end
  end
  
  def self.parse_api_results(results)
    results.each do |member|
      #local_member = Member.where(d4h_id: member["id"])
      #puts "#{member['name']} #{member['status']}"
    end
  end
  
end
