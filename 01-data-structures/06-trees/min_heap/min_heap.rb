require_relative 'node'

class MinHeap
  attr_accessor :heap

  def initialize
    @heap = Array.new
  end

  def bubble_up(index)
    parent_index = (index / 2 )

    if index === 0
      return
    elsif @heap[parent_index].rating > @heap[index].rating
      exchange(parent_index, index)
      bubble_up(parent_index)
    end
  end

  def exchange(source, target)
    temp = @heap[source]
    @heap[source] = @heap[target]
    @heap[target] = temp 
  end

  def insert(data)
    @heap << data
    bubble_up(@heap.length - 1)
  end

  def delete(data)
    @heap.each_with_index do |item, i|
      if item && item === data
        @heap.delete_at(i)
      end
    end
    bubble_up(@heap.length - 1)
  end

  def find(data)
    @heap.each do |item|
      if item && item === data
        return item
      end
    end
  end

  def print
    @heap.each do |item|
      puts "#{item.title}: #{item.rating}\n" if item
    end
  end
end
