require 'gosu'

class Game < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Snake Game"

  end

  def update
    # ...
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
end

Game.new.show
