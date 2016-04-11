class Users < ActionMailer::Base
  
  default from: "scott.hillson@gmail.com"
  
  def signup_email(subject,token,to)
    @token = token
    mail(to: to, subject: subject)
  end
  
end
