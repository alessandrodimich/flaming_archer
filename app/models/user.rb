class User < ActiveRecord::Base

  attr_accessible :email, :username, :password, :password_confirmation, :password_reset_token,           :password_reset_sent_at
  has_secure_password

  validates(:username, presence: true, length: { maximum: 50 }, uniqueness:{ case_sensitive: false})
  #VALID_EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})
  #validates_presence_of :password, :on => :create
   validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_length_of :password, within: 6..30, :if => :password_required?
  #validates_length_of :password_confirmation, within: 6..30, :if => :password_required?

  before_create { generate_token(:remember_me_token) }

  def send_password_reset(user)
    generate_token(:password_reset_token)
    self.update_attributes(:password_reset_sent_at => Time.zone.now)
    UserMailer.password_reset(self).deliver
    save!

  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def password_required?
     password_digest.blank? || password && password_confirmation
  end

end
