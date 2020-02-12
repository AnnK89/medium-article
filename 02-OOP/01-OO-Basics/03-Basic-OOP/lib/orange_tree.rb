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

  def dead?
    @dead
  end

  def one_year_passes!
    unless dead?
      @age += 1
      grow_up
      grow_fruits
      may_die?
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end

  private

  def grow_up
    @height += 1 if @age <= 10
  end

  def grow_fruits
    @fruits = 0

    if @age > 5 && @age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    end
  end

  def may_die?
    if @age == 100
      @dead = true
    elsif @age > 50
      @dead = (@age >= rand(51..100)) # or (1..@age).to_a.sample > 50
    end
  end
end


# orange = OrangeTree.new

# orange.one_year_passes!
