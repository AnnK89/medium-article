# TODO: Write a seed
require 'Faker'

5.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email
  )
  user.save!
end

User.all.each do |user|
  rand(5..10).times do
    post = Post.new(
      name: Faker::Movie.quote,
      url: "www.#{Faker::Company.name}.com",
      votes: rand(0..10)
    )
    post.user = user
    post.save!
  end
end
