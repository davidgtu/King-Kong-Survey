class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
end

def choice
  choice.question
end

def question
  question.survey.title
end
