require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @oldHead = nil
    @nodes = 0.0
  end

  def []=(key, value)
    i = index(key, size)
    @oldHead = @items[i]
    node = Node.new(key, value)
    @items[i] = node
    if @oldHead != nil
      p 'collision'
      @items[i].next = @oldHead
      if @oldHead.value != value
        p 'values dont match'
        resize 
      end
    else
      p 'no collision'
    end
    @nodes +=1.0

  end


  def [](key)
    i = index(key, size)
    @oldHead = @items[i]
    if @oldHead != nil
      while @oldHead.next != nil
        if @oldHead.key == key
          return @oldHead.value
        end
        @oldHead = @oldHead.next
      end 
      return @oldHead.value
    end
    return nil
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size   
  end

  # Calculate the current load factor
  def load_factor
    @nodes / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    resized = Array.new(@items.length * 2) {|i| nil} 
    @items.each do |item|
      if item != nil
        new_index = index(item.key, resized.length)
        resized[new_index] = item
      end
    end
    @items = resized    
  end
  def status
      if @nodes === 0.0
          puts "There are no entries in this hash."
          puts "Load Factor for hash is 0."
      else
        @items.each do |item|
            unless item == nil
                index = self.index(item.key, @items.length)
                puts "Entry #{item} is located at Index #{index} and has a value of " + "\"" + "#{item.value}" + "\"" + "."
            end
        end
        puts "Load Factor for hash is #{@nodes / @items.length}."
      end
  end    
end
