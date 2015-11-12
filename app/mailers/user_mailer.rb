class UserMailer < ActionMailer::Base
  default :from => 'wolfie@johnsonch.com'
  def registration_confirmation()
    @url = "http://portal.herokuapp.com/login"
    mail(:to => 'chris@johnsonch.com', :subject => "Registered")

  end
end
