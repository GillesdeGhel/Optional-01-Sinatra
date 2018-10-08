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
  @cookbook   = Cookbook.new(csv_file)
  @book = @cookbook.all
  erb :index
end

get '/about' do
  erb :about
end

get '/create' do
  erb :create
end


post '/create' do
  # 1 create recipe
  recipe = Recipe.new(params[:title], params[:description], params[:duration], params[:difficulty], false)
  # 2 add to list
  csv_file = File.join(__dir__, 'recipes.csv')
  @cookbook = Cookbook.new(csv_file)
  @cookbook.add_recipe(recipe)
  # @recettes = @cookbook.all
  redirect "/"
  # create recipe based on info
end

get '/remove/:index' do
  index = params[:index].to_i
  csv_file = File.join(__dir__, 'recipes.csv')
  @cookbook = Cookbook.new(csv_file)
  @cookbook.remove_recipe(index)
  # @recettes = @cookbook.all
  redirect '/'
end

get '/import' do
  erb :import
end

post '/import' do
  url = params

  end

