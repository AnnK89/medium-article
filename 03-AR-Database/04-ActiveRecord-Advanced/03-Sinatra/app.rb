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

post '/' do
  new_post = Post.new(params)
  new_post.save
  redirect '/'
end

get '/:id/upvote' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save
  redirect '/'
end

get '/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/'
end

get '/:id/edit' do
  erb :edit_post
end

post '/:id/edit' do
  @post = Post.find(params[:id])
  @post.name = params[:name]
  @post.url = params[:url]
  @post.save
  redirect '/'
end
