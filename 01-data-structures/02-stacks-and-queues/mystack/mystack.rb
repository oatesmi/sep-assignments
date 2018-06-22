class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack = @stack + [item]
    self.top = item
  end

  def pop
    temp = self.top
    @stack = @stack - [self.top]
    self.top = @stack.last
    temp
  end

  def empty?
    return true if @stack.length == 0
    false
  end
end
