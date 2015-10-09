class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :responses
  has_many :surveys, foreign_key: :author_id
end
