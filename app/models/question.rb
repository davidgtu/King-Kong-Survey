require 'pry'
class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey


  def get_choices
    self.choices.map{ |choice| "<p>" + choice.content + "</p>" }.join(" ")
  end
end
