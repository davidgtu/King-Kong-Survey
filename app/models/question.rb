require 'pry'
class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey


  def get_choices
    stuff = self.choices.map{ |choice| "<p>"+choice.content }.join("</p>")+"</p>"
  end
end
