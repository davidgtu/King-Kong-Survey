class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice

  def get_question
    self.choice.question.get_title
  end

end
