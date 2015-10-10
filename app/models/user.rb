class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :responses

  validates :username, presence: true
  validates :password, length: { in: 3..20 }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
