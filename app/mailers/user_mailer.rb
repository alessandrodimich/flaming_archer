class UserMailer < ActionMailer::Base
  default :from => "dimichrails@railscasts.com"

  def registration_confirmation(user)
    #@user = user > to pass a user object in the mail
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
