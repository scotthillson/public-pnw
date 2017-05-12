# A user is the pnwsar.org account for each member.

class User < ActiveRecord::Base

  validates_uniqueness_of :email, case_sensitive: false
  has_secure_password validations: false
  validates_presence_of :email
  before_save :downcase_email

  def self.my_messages(params)
    unless params[:access_token]
      return false
    end
    user = find_by_token(params[:access_token])
    unless user
      return false
    end
    member = Member.find_by_email(user.email)
    unless member
      return false
    end
    member.messages
  end

  def downcase_email
    email = self.email.downcase
  end

  def refresh
    self.password_digest = nil
    self.token = SecureRandom.hex(24)
    self.save
    Users.signup_email('New User Signup', self.token, self.email ).deliver
  end

  def set_password
    if self.password_digest
      self.token = SecureRandom.hex(24)
      self.save
    else
      false
    end
  end

  def seen
    self.last_seen = DateTime.now
    self.save
  end

end
