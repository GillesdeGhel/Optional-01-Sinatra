require 'csv'

class Cookbook
  attr_reader :book

  def initialize(csv_file)
    @book = []
    @csv_file = csv_file
    CSV.foreach(csv_file) do |row|
      @book << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def find_recipe(index)
    @book[index]
  end

  def all
    @book
  end

  def mark_as_true
    CSV.open(@csv_file, 'wb') do |csv|
      @book.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.done]
      end
    end
  end

  def add_recipe(recipe)
    CSV.open(@csv_file, 'ab') do |csv|
      csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.done]
    end
    @book << recipe
  end

  def remove_recipe(index)
    @book.delete_at(index)
    CSV.open(@csv_file, 'wb') do |csv|
      @book.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.done]
      end
    end
  end
end
