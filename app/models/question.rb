class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey

  validates :prompt, presence: true

  def get_choices
    self.choices.map{ |choice| "<p>" + choice.content + "</p>" }.join(" ")
  end

   def get_title
    self.survey.title
  end
end
