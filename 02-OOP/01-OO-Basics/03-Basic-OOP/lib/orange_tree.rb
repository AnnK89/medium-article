require 'pry-byebug'

class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :height, :fruits
  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def one_year_passes!
    @age += 1
    @height += 1 if @age <= 10
    @dead = true if (1..@age).to_a.sample > 50 || @age == 100
    if @age > 5 && @age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    else
      @fruits = 0
    end
  end

  def dead?
    @dead ? true : false
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end
end

# increase the probability of dying if tree > 50

orange = OrangeTree.new

orange.one_year_passes!
