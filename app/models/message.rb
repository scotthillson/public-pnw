class Message < ActiveRecord::Base
  require 'twilio-ruby'

  scope :recent,   -> { where(created_at: (Time.now - 24.hours)..Time.now) }
  scope :outbound, -> { where('direction LIKE ?', '%outbound%').last(9999) }
  scope :inbound,  -> { where('direction LIKE ?', '%inbound%').last(9999) }

  belongs_to :incident
  belongs_to :member, foreign_key: :from, primary_key: :mobile_phone

  AVAILABLE = [
    "available",
    "responding"
  ]

  UNAVAILABLE = [
    "not available",
    "unavailable",
    "unavail",
    "nope",
    "no",
    "can't",
    "cant"
  ]

  def self.test
    Message.send('5039290055','5038500198','hello world!')
  end

  def self.get_message(message)
    sid = "ACfef32e24e1778fa357f75dbab305850a"
    token = "3160c85db0b69eefdd3f77e2004feb31"
    client = Twilio::REST::Client.new sid, token
    message = client.account.messages.get(message)
    puts message.body
    puts message.direction
  end

  def self.get_messages
    sid = "ACfef32e24e1778fa357f75dbab305850a"
    token = "3160c85db0b69eefdd3f77e2004feb31"
    client = Twilio::REST::Client.new sid, token
    client.account.messages.list.each do |message|
      unless find_by(sid: message.sid)
        store_message(message)
      end
    end
  end

  def self.store_message(m)
    Message.create(
      sid: m.sid,
      date_created: m.date_created,
      date_updated: m.date_updated,
      date_sent: m.date_sent,
      messaging_service_sid: m.messaging_service_sid,
      from: m.from.tr('^0-9',''),
      to: m.to,
      body: m.body,
      num_media: m.num_media,
      num_segments: m.num_segments,
      status: m.status,
      error_code: m.error_code,
      error_message: m.error_message,
      direction: m.direction,
      price: m.price,
      price_unit: m.price_unit,
      api_version: m.api_version,
      uri: m.uri,
      subresource_uri: m.subresource_uris
    )
  end

  def self_translate(choice)
    if choice == 'available'
      translation = 'available'
    elsif choice == 'unavailable'
      translation = 'unavailable'
    end
  end

  def translate
    if UNAVAILABLE.include? body.downcase
      translation = 'unavailable'
    elsif AVAILABLE.include? body.downcase
      translation = 'available'
    else
      translation = 'exception'
    end
  end

end
