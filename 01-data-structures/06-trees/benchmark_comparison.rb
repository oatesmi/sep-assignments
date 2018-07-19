require 'benchmark'
require_relative 'min_heap/min_heap.rb'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'binary_tree/node.rb'

root = Node.new("1", 1)
bst = BinarySearchTree.new(root)
mh = MinHeap.new

Benchmark.bm do |x|
  x.report("Binary Search Tree - insert:") do
    n=2
    10_000.times do
      node = Node.new("#{n}", n)
      n += 1
      bst.insert(root, node)
    end
  end
  x.report("          Min Heap - insert:") do
    n=2
    10_000.times do
      data = Node.new("#{n}", n)
      n += 1
      mh.insert(data)
    end
  end
  x.report("  Binary Search Tree - find:") { bst.find(root, "5000") }
  x.report("            Min Heap - find:") { mh.find("5000") }
  x.report("Binary Search Tree - delete:") { bst.delete(root, "5000") }
  x.report("          Min Heap - delete:") { mh.delete("5000") }
end
