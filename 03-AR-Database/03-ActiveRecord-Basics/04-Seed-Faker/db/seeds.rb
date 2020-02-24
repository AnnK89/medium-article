require "faker"

# TODO: Write a seed to insert 100 posts in the database

100.times do
  post = Post.new(
    title: Faker::Games::Pokemon.name,
    url: "www.#{Faker::Games::Pokemon.location}.com"
  )
  post.save
end
