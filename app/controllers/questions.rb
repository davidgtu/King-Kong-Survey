get "/questions/:id" do |id|
  @question = Question.find(id)
  erb: "questions/show"
end