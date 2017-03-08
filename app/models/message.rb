class Message < ActiveRecord::Base

  belongs_to :incident
  belongs_to :member

  scope :recent, -> { where(created_at: (Time.now - 24.hours)..Time.now) }

  Twilio.configure do |config|
    config.account_sid = "AC7b8306695da1683c275e2189b2f3074c"
    config.auth_token = "9905d3483fc19f17e4b4f236f7911a4a"
  end

  def self.send(to, from, body)
    client = Twilio::REST::Client.new
    client.messages.create( from: from, to: to, body: body)
  end

end
