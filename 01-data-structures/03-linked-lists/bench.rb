require "benchmark"
require_relative 'linked_list'
arr = []
llist = LinkedList.new
Benchmark.bm(7) do |x|
    x.report "array_build" do
        10_000.times do |i|
          ascii_code = rand(255)
          random_char = ascii_code.chr
          arr << random_char
        end
    end
      x.report "linked_list_build" do
        10_000.times do |i|
          ascii_code = rand(255)
          random_char = ascii_code.chr          
          node = Node.new(random_char)
          llist.add_to_tail(node)
        end
      end 
      
      x.report "array_access" do
        el = arr[4999]
        el
      end
      x.report "linked_list_access" do
        current = llist.head
        i = 0
        while i < 4999
          current = current.next
          i += 1
        end
        current
      end   
       x.report "array_remove" do
        el = arr.slice!(4999)
        el
      end
      x.report "linked_list_remove" do
        current = llist.head
        i = 0
        while i < 4999
          current = current.next
          i += 1
        end
        llist.delete(current)
        llist
      end
end




