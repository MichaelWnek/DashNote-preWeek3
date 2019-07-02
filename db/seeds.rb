require 'faker'

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Lorem.characters(6)
    )
end
users = User.all

100.times do
  post = Post.create!(
    author: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    created_at: rand(10.minutes .. 1.year).ago
  )
end
posts = Post.all

300.times do
  Comment.create!(
    author: users.sample,
    post: posts.sample,
    body: Faker::TwinPeaks.quote,
    created_at: rand(10.minutes .. 1.year).ago
  )
end

User.create!(
  first_name: 'admin',
  last_name: 'user',
  email: 'admin@mh.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
