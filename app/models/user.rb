class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :surveys, through: :user_surveys, foreign_key: :author_id
  has_many :responses
end
