require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  
  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head
    if current == nil
      @head = node
      @tail = node
      @head.next = nil
      @tail.next = nil
    else
      while current.next != nil
        current = current.next
      end
      current.next = node  #must set temp to tail too at some point
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail == nil 
      nil
    elsif @head.next == nil
      @head = nil
      @tail = nil
    else
      temp = @head
      while temp.next.next != nil
        temp = temp.next
      end   
      @tail = temp
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    els = []
    temp = @head
    unless temp == nil
      while temp.next != nil
        els << temp.data
        temp = temp.next
      end
    end
    els << temp.data
    puts els
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail
      remove_tail
    elsif node == @head
      remove_front
    elsif @head == nil 
      nil
    elsif @head == node
      @head = @head.next
    else
      temp = @head
        while temp.next != node
          temp = temp.next
        end
        if temp.next.next != nil
          temp.next = temp.next.next
        else
          temp.next = nil
        end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      temp = @head
      @head = node
      @head.next = temp
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      nil
    elsif @head.next == nil
      @head = nil
    else
      @head = @head.next
    end
  end
end