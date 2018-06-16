require_relative 'node'
require 'benchmark'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      current_node = @head
      while current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts "#{current_node.data}\n"
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node === @tail
      remove_tail
      return
    elsif node === @head
      remove_front
      return
    else
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head === nil
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next
    end
  end
end
  #
  # def measure(number)
  #   i = 0
  #   while i <= number
  #     new_head = Node.new('n' + i.to_s)
  #     self.add_to_tail(new_head)
  #     i += 1;
  #   end
  #   self
  # end
  #
  # def build(number)
  #   array = []
  #   i = 0
  #   while i <= number
  #     array << i
  #     i += 1
  #   end
  #   array
  # end
  #
  # def ary_find(array, number)
  #   i = 0
  #   until array[i] == array[number]
  #     i += 1;
  #   end
  #   self
  # end
  #
  # def llsearch(llist, number)
  #   i = 0
  #   while i < number
  #     if @head != @tail
  #       i += 1
  #     end
  #   end
  #   self
  # end
  #
  # def ary_del(array, index)
  #   array.delete_at(index)
  #   self
  # end
  #
  # def list_del(llist, number)
  #   x = llsearch(llist, number+1)
  #   x
  # end
# end

# n = LinkedList.new
#
# array = n.build(10_000)
# llist = n.measure(10_000)
#
# Benchmark.bmbm do |x|
#   x.report('build array:    ') { n.build(10_000) }
#   x.report('build list:     ') { n.measure(10_000) }
#   x.report('array find 5k:  ') { n.ary_find(array, 5_000) }
#   x.report('list find 5k:   ') { n.llsearch(llist, 5_000) }
#   x.report('array remove 5k:') { n.ary_del(array, 5_000) }
#   x.report('list remove 5k: ') { n.list_del(llist, 5_000) }
# end
