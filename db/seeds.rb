require 'faker'

#1.) Check for Faker in the Gem File
#2.) Require Faker in the Seed File
#3.) Retrieve Faker Here: https://github.com/stympy/faker

20.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password_hash: "123"
    )
end

10.times do
  Question.create(
    title: Faker::Lorem.words(4),
    body: Faker::Lorem.sentence,
    user_id: rand(1..20)
    )
end

10.times do
  Answer.create(
    body: Faker::Lorem.paragraph,
    user_id: rand(1..20)
    )
end

10.times do
  Vote.create(
    user_id: rand(1..20),
    voteable_id: rand(1..10),
    voteable_type: ["Answer", "Question"].sample
    )
end
