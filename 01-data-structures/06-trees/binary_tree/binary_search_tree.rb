require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @found = false
    @root = root
  end

  def insert(root, node)

      current_node = @root
    
      while current_node != nil
      
        if (node.rating < current_node.rating) && (current_node.left == nil)
          # new node is lower and there is no existing node lower then current
          current_node.left = node
          current_node.left.parent = current_node
        elsif (node.rating > current_node.rating) && (current_node.right == nil)
          # new node is higher and there is no existing node higher then current
          current_node.right = node
          current_node.right.parent = current_node
        elsif (node.rating < current_node.rating)
          # new node is lower and their IS an exisiting lower node so we need to step to it 
          current_node = current_node.left
        elsif (node.rating > current_node.rating)
          # new node is higher and their IS an exisiting higher node so we need to step to it 
          current_node = current_node.right
        else
          return
        end
      end
  end

  # Recursive Depth First Search
  def find(root, data)
 
# if root title matches return root
    if root.title == data
      return root
    else
      if root.left != nil
        find(root.left, data)
      elsif root.right != nil  
        find(root.right, data)
     else
       return
     end
    end



  end

  def delete(root, data)
    current_node = find(root,data)
    
    if current_node == nil
      return nil
    elsif current_node.left == nil && current_node.right == nil
      current_node.parent.left = nil if current_node == current_node.parent.left
      current_node.parent.right = nil if current_node == current_node.parent.right
    elsif current_node.left != nil && current_node.right == nil
      current_node.parent.left = current_node.left if current_node.parent.left == current_node
      current_node.parent.right = current_node.left if current_node.parent.right == current_node
    elsif current_node.right != nil && current_node.left == nil
      current_node.parent.left = current_node.right if current_node.parent.left == current_node
      current_node.parent.right = current_node.right if current_node.parent.right == current_node
    else #current_node.right != nil && current_node.left != nil
       current_node.parent.left = current_node.left if current_node.parent.left == current_node
       current_node.parent.right = current_node.left if current_node.parent.right == current_node  
       @min = lowest_left(current_node)
       delete(root, @min.title)
       current_node.title = @min.title
       current_node.rating = @min.rating
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
   # With Breadth-First Search (BFS), we search an entire row of Nodes before we proceed to the next.  
    # First step: Put the source node into a queue and mark it as visited
    queue = []
    current_node = @root
    printer = []
    queue << current_node
    printer << "#{current_node.title}: #{current_node.rating}" 
    mystring = ""

    loop do
       break if queue.empty?
       current_node = queue.shift #removes node and returns it
       if current_node.left != nil
         queue << current_node.left 
         printer << "#{current_node.left.title}: #{current_node.left.rating}" 
       end
       if current_node.right != nil
         queue << current_node.right 
         printer << "#{current_node.right.title}: #{current_node.right.rating}" 
       end   
    end
    
    $stdout.puts printer
     
  end

  
  def lowest_left(root)
    until current_node.left == nil && current_node.right == nil
      current_node = current_node.left == nil ? current_node.right : current_node.left #assuming we can have cases where there is no left node
    end
    return current_node
  end
  
end
