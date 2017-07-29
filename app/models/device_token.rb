class DeviceToken < ActiveRecord::Base

  def self.sanitized_phone(params)
    base = params[:mobile_phone].gsub(/[^0-9]/, '')
    return nil unless base.length > 9 && base.length < 12
    base = "1#{base}" if base[0] != '1'
    base
  end

  def self.verify_token(params)
    return nil unless params[:code] && sanitized_phone(params)
    device_token = find_by(
      mobile_phone: sanitized_phone(params),
      code: params[:code]
      )
    return nil unless device_token && device_token.created_at + 86400 > DateTime.now
    device_token.verified_at = DateTime.now
    device_token.save
    device_token.token
  end

  def create_token(params)
    new_token = new
    new_token.token = SecureRandom.hex(24)
    new_token.code = rand(10 ** 6)
    new_token.mobile_phone = sanitized_phone(params)
    new_token.expiry = DateTime.now + 1
    new_token.save
    new_token
  end

  def self.request(params)
    return nil unless sanitized_phone(params)
    member = Member.find_by_mobile_phone(sanitized_phone(params))
    return nil unless member
    return if find_by('mobile_phone = ? and created_at > ?', sanitized_phone(params), 2.hours.ago)
    token = create_token(params)
    generate(token)
  end

  def self.generate(token)
    body = "Your verification code is #{token.code}"
    begin
      Message.send_message(token.mobile_phone, body)
      true
    rescue Twilio::REST::RequestError => e
      puts e.message
      true
    end
  end

end
