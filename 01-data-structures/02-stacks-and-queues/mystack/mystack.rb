class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
  # INCREMENT the stack position index by 1
  # ASSIGN element to the location at the stack position index    
    self.top == nil ? i = 0 : i = @stack.index(self.top)
    i+=1
    @stack[i] = item
    self.top = @stack[i]
  end

  def pop
  # ASSIGN the element at the stack position index to temp
  # DECREMENT the stack position index by 1
  # RETURN temp
    self.top == nil ? i = 0 : i = @stack.index(self.top)
    @temp = self.top
    i-=1
    i >= 0 ? self.top = @stack[i] : self.top = nil
    return @temp
  end

  def empty?
    self.top == nil ? true : false
  end

end