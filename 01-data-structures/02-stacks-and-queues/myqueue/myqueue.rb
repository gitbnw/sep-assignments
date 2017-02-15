class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    # Add element to the tail
    i = @queue.length
    @queue[i] = element
    @head = @queue[0]
    @tail = @queue[i]
  end

  def dequeue
  # SET temp to the first element
  empty? ? @temp = nil : @temp = @queue[0]
  # Left-Shift the list by one entry
  if empty? || @queue.length == 1
    @queue = []
  else
    @queue = @queue[1..@queue.length]
  end
  p @queue
  # RETURN temp
  @head = @queue[0]
  @tail =  @queue[@queue.length]
  return @temp
  end

  def empty?
    @queue.length <= 0 ? true : false
  end
end