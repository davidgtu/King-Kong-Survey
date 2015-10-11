get '/surveys/:id/responses' do
  @survey = Survey.find(params[:id])  
  erb :'/responses/show'
end
