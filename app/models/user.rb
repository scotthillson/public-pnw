class User < ActiveRecord::Base
  
  has_secure_password validations: false
  validates_presence_of :email
  before_save :downcase_email
  
  def downcase_email
    email = self.email.downcase
  end
  
  def refresh
    self.password_digest = nil
    self.token = SecureRandom.hex 24
    self.save
    Users.signup_email('New User Signup', self.token, self.email ).deliver
  end
  
  def set_password
    if self.password_digest
      self.token = nil
      self.save
      true
    else
      false
    end
  end
  
end
