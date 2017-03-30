require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @found = false
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
      @found = true
      return root 
    end
    
    find(root.left, data) if root.left  && @found == false
    find(root.right, data) if root.right && @found == false


  end

  def delete(root, data)
    current_node = find(root,data)
    
    if current_node.left == nil && current_node.right == nil
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
    end
    
    if current_node.left.left != nil
      @templeft = current_node.left.left
      insert()
    
    

    
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
