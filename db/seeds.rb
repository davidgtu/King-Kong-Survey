User.create ([
  {username: "Clock", password: "watch"},
  {username: "Lebron", password: "james"}])

Survey.create ([
  {author_id: 1, title: "Baby Names", about: "This is a survey about baby names! ;)"},
  {author_id: 1, title: "Addresses", about: "Preferred Address"}])

Question.create ([
  {survey_id: 1, prompt: "What name would you pick for a baby boy?"},
  {survey_id: 1, prompt: "What name would you pick for a baby girl?"},
  {survey_id: 2, prompt: "What street address do you prefer?"},
  {survey_id: 2, prompt: "What zip code do you like?"}])

Choice.create ([
  {question_id: 1, content: Faker::Name.name},
  {question_id: 1, content: Faker::Name.name},
  {question_id: 1, content: Faker::Name.name},
  {question_id: 2, content: Faker::Name.name},
  {question_id: 2, content: Faker::Name.name},
  {question_id: 2, content: Faker::Name.name},
  {question_id: 3, content: Faker::Address.street_name},
  {question_id: 3, content: Faker::Address.street_name},
  {question_id: 3, content: Faker::Address.street_name},
  {question_id: 4, content: Faker::Address.zip},
  {question_id: 4, content: Faker::Address.zip},
  {question_id: 4, content: Faker::Address.zip}])
