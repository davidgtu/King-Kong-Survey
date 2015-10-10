class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :responses

  validates_presence_of :username,
  #:password-- Validating in views/users/new.

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
