ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "flamingarch",  #dimichrails
  :password             => "12345432",     #incorrect71
  :authentication       => "plain",
  :enable_starttls_auto => true
}