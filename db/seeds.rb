require 'faker'

def fake_user
  { username: Faker::Internet.user_name,
    password: "password" }
end

def fake_post
  { user_id: (1..11).to_a.sample,
    title: Faker::Company.catch_phrase,
    url_link: Faker::Internet.url }
end

def fake_comment
  { user_id: (1..11).to_a.sample,
    post_id: (1..20).to_a.sample,
    body: Faker::Lorem.paragraph( (1..10).to_a.sample ) }
end

User.create( { username: "toreyhickman", password: "password" } )

10.times do
  User.create(fake_user)
end

20.times do
  Post.create(fake_post)
end

60.times do
  Comment.create(fake_comment)
end
