class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def user_invite(user)
    @greeting = "Hi"
    mail to: user.email, subject: 'PNW Invitation'
  end
end
