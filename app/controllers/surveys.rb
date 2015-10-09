get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end

get "/surveys/:id" do |id|
  @survey = find(id)
  erb :"surveys/show"
end