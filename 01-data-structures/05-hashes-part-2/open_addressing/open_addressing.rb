require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @nodes = 0.0
  end

  def []=(key, value)
    i = index(key, size)
    
    if @items[i] == nil
      # no collision
      p 'no collision'
      @items[i] = Node.new(key, value)
      @nodes += 1      
    elsif @items[i].key === key && @items[i].value != value
    #update
      p 'update'
      @items[i].value = value
    else
      #collision so find next open index
      p 'collision'
      j = next_open_index(i)
      if j === -1
        # no openings!
        p "no openings"
          resize
          self[key] = value # this is basically - try again
      else
        p "opening found"
          @items[j] = Node.new(key, value)
          
      end  
      @nodes += 1
    end
    
  end

  def [](key)
      i = index(key, size)
      until i === @items.length
          if @items[i] == nil
            p 'empty'
              # i += 1
              return nil
          elsif @items[i].key === key
          p 'lookup collision, same key'
              return @items[i].value
          else
            p 'lookup collision, different key'
              i += 1 
          end
      end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size 
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    end_point = @items.length + 1  #track array size instead
    @items[index - 1..end_point].each_with_index do |item, i|
      if item == nil
        return i + index - 1
      end
    end
    return -1 ##no empties
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