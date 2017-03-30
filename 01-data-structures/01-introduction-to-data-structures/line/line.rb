# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members << person
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.members[0]
  end

  def middle
    self.members[(self.members.length/2).floor]
  end

  def back
    self.members[self.members.length - 1]
  end

  def search(person)
    index(person).nil? ? nil : self.members[index(person)]
  end

  private

  def index(person)
    self.members.index(person)
  end

end