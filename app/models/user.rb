class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :username, :password, :password_confirmation

  validates(:username, presence: true, length: { maximum: 50 }, uniqueness:{ case_sensitive: false})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})
  validates(:password, length: { minimum: 6 })

  before_create { generate_token(:remember_me_token) }

private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
