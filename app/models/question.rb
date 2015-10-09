class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey


  def get_choices

  end
end
