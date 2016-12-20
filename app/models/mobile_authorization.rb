class MobileAuthorization < ActiveRecord::Base
  
  belongs_to :member
  
  def self.new_authorization(member)
    where(member_id: member.id).destroy_all
    new_authorization = new
    new_authorization.send_authorization_code
  end
  
  def send_authorization_code
    token = rand(10 ** 10)
    save
    body = "Your verification code is #{token}"
    TwilioMessage.send(to, from, body)
  end
  
  def finalize_authorizaiton
    member.authorized = Timestamp.now
    member.save
    token = nil
    save
  end
  
end
