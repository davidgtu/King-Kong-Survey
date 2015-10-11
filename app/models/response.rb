class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
end

# def survey
#   choice.question.survey
# end

# def question
#   choice.question
# end
