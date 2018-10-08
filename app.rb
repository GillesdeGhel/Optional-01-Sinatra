require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'cookbook.rb'
require_relative 'recipe.rb'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  csv_file   = File.join(__dir__, 'recipes.csv')
  cookbook   = Cookbook.new(csv_file)
  @book = cookbook.all
  erb :index
end

get '/about' do
  erb :about
end

get '/create' do
  erb :create
end


get '/team/:username' do
  puts params[:username]
  "The username is #{params[:username]}"
end

get '/team/:username' do
  binding.pry  # <= code will stop here for HTTP request localhost:4567/team/someone
  # [...]
end

