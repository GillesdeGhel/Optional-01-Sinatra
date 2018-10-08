class Recipe
  attr_reader :name, :description, :time, :difficulty
  attr_accessor :done

  def initialize(name, description, time, difficulty, done = "false")
    @name = name
    @description = description
    @time = time
    @difficulty = difficulty
    @done = done
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = "true"
  end
end
