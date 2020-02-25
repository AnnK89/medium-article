require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

get '/' do
  @posts = Post.all.order(votes: :desc)
  erb :posts
end

get '/upvote/:id' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save
  redirect '/'
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  new_post = Post.new(name: params[:name], url: params[:url])
  new_post.save
  redirect '/'
end
