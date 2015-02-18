class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, on: :create
  before_save :downcase_email
  
  def downcase_email
    email = email.downcase
  end
  
end