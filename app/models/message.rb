class Message < ActiveRecord::Base
  require 'twilio-ruby'

  @sid = "ACfef32e24e1778fa357f75dbab305850a"
  @token = "3160c85db0b69eefdd3f77e2004feb31"

  before_save :translate

  AVAILABLE = [
    "available",
    "responding"
  ]

  AVAILABLE_MATCH = [
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

  def self.create_with_token(params)
    token = DeviceToken.find_by_token(params[:token])
    return false unless token && token.verified_at
    store_message(OpenStruct.new(params))
  end

  def self.store_message(m)
    Message.create(
      body: m.body,
      date_sent: m.date_sent,
      to_phone: m.to_phone,
      from_phone: m.from,
      direction: m.direction
    )
  end

  def member
    Member.where('mobile_phone = ? or mobile_phone = ?', from_phone, to_phone).first
  end

  def incident_members
    member.incident_members
  end

  def self.send_message(to, body)
    client = Twilio::REST::Client.new @sid, @token
    message = client.account.messages.create({
      from: '15038500198',
      to: '15039290055', #fix this to go live duhh
      body: body})
    store_twilio_message(message)
  end

  def self.get_message(message)
    client = Twilio::REST::Client.new @sid, @token
    message = client.account.messages.get(message)
    puts message.body
    puts message.direction
  end

  def self.get_messages
    client = Twilio::REST::Client.new @sid, @token
    client.account.messages.list.each do |message|
      unless find_by(sid: message.sid)
        store_twilio_message(message)
      end
    end
  end

  def self.store_twilio_message(m)
    Message.create(
      sid: m.sid,
      date_created: m.date_created,
      date_updated: m.date_updated,
      date_sent: m.date_sent,
      messaging_service_sid: m.messaging_service_sid,
      from_phone: m.from_phone.tr('^0-9',''),
      to_phone: m.to_phone.tr('^0-9',''),
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
      self.translation = 'unavailable'
    elsif AVAILABLE.include? body.downcase
      self.translation = 'available'
    else
      self.translation = 'exception'
    end
  end

end
