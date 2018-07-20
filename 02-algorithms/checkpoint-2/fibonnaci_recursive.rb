require 'benchmark'

def fib(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fib(n-1) + fib(n-2)
  end
end

Benchmark.bmbm do |x|
  x.report('recursive fib(20):') { fib(20) }
end
