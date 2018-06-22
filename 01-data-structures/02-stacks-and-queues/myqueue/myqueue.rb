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
    return true if @queue.length == 0
    false
  end
end
