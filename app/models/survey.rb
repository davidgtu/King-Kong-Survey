class Survey < ActiveRecord::Base
  has_many :user_surveys
  belongs_to :user, foreign_key: "author_id"
  has_many :questions
end
