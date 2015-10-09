class Question < ActiveRecord::Base
  has many :choices
  belongs_to :survey
end
