require 'benchmark'

def fib(n)
  fib_0 = 0
  fib_1 = 1

  (0..n-1).each do |n|
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_0
  end
  fib_1
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)

Benchmark.bmbm do |x|
  x.report('iterative fib(20):') { fib(20) }
end 
