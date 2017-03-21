class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)

    if @items[index(key, size)] == nil || (@items[index(key, size)] != nil && @items[index(key, size)].value == value)
      p "no collision"
    elsif @items[index(key, size)] != nil && @items[index(key, size)].value != value
      p "collision and values not matched"
      resize
    elsif @items[index(key, size)] != nil && @items[index(key, size)].key != key
     p "collision and keys not matched"
      resize until @items[index(key, size)] == nil || @items[index(key, size)].value == value
    end
    
    @items[index(key, size)] = HashItem.new(key, value)
    
  end


  def [](key)
    @items[index(key, size)].value unless @items[index(key, size)] == nil
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    #true_index = hash(key) % k
    code = 0
    key.split(%r{\s*}).each do |letter|
      code += letter.ord 
    end
    puts code
    return code % size

  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end