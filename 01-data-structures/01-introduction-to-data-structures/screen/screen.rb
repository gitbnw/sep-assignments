require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      self.matrix[x] = []
      self.matrix[x][y] = pixel
    end
  end

  def at(x, y)
    unless self.matrix[x] == nil
      self.matrix[x][y]
    end
   end

  private

  def inbounds(x, y)
    if x > self.width || y > self.height || x < 0 || y < 0
      return false
    else
      return true
    end
  end

end