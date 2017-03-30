class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    unless @stack == nil
      @temp = self.top
      if @stack.length - 2 > -1
        @stack =  @stack[0..@stack.length - 2]
        self.top = @stack[@stack.length - 1]
      else
        @stack = nil
        self.top = nil
      end
      return @temp
    end
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end
end