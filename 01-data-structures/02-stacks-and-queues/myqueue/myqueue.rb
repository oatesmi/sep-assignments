class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    @queue.shift
    @head = @queue[0]
    @tail = @queue.last
  end

  def empty?
    @queue.length < 1
  end
end

n = MyQueue.new
n.enqueue("Rob")
n.enqueue("Tom")
n.enqueue("Julian")
n.enqueue("Kanye")
puts n.head
puts n.tail
n.dequeue
puts n.head
puts n.tail
puts n.empty?
