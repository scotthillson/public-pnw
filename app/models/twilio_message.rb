class TwilioMessage < ActiveRecord::Base
  
  Twilio.configure do |config|
    #config.account_sid = account_sid
    #config.auth_token = auth_token
  end
  
  #@client = Twilio::REST::Client.new
  
  def self.send(to, from, body)
    #@client.messages.create( from: from, to: to, body: body)
  end
  
end
