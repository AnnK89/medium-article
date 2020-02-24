require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
require 'pry-byebug'

response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
id_repos = JSON.parse(response).first(10) # returns post ids

id_repos.each do |id|
  url = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  contents = JSON.parse(url)
  post = Post.new(
    title: contents['title'],
    url: contents['url']
  )
  post.save
end
