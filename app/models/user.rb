# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  username               :string(255)      not null
#  password_digest        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  remember_me_token      :string(255)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#

class User < ActiveRecord::Base

  attr_accessible :email, :username, :password, :password_confirmation, :password_reset_token, :password_reset_sent_at, :first_name, :last_name


  has_secure_password

  validates(:username, presence: true, length: { maximum: 50 }, uniqueness:{ case_sensitive: false}, format: { with: VALID_USERNAME_REGEX })
  #VALID_EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})
  #validates_presence_of :password, :on => :create
  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_length_of :password, within: 6..30, :if => :password_required?
  #validates_length_of :password_confirmation, within: 6..30, :if => :password_required?

  before_create { generate_token(:remember_me_token) }
  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
  before_save  :capitalize_name

  def send_password_reset(user)
    generate_token(:password_reset_token)
    self.update_attributes(:password_reset_sent_at => Time.zone.now)
    UserMailer.password_reset(self).deliver
    save!

  end

  def full_name
    [first_name, last_name].join " "
  end




  protected

    def capitalize_name
     first_name.capitalize! if first_name
     last_name.capitalize! if first_name
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
