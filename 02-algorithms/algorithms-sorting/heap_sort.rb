module HeapSort
  def self.sort(array, compare = lambda { |a,b| a <=> b })
    heap_size = array.length
    self.build_heap(array, compare)
    while heap_size > 1
      heap_size -= 1
      array[0], array[heap_size] = array[heap_size], array[0]
      self.heapify(array, 0, compare)
    end
    array
  end

  private

  def self.heapify(array, i = 0, compare)
    left_child = i * 2 + 1
    right_child = i * 2 + 2
    largest = i

    if left_child < array.length and compare.call(array[left_child], array[largest]) > 0
      largest = left_child
    end

    if right_child < array.length and compare.call(array[right_child], array[largest]) > 0
      largest = right_child
    end

    if largest != i
      array[i], array[largest] = array[largest], array[i]
      self.heapify(array, largest, compare)
    end
  end

  def self.build_heap(array, compare)
    (array.length / 2).floor.downto(0) do |i|
      self.heapify(array, i, compare)
    end
  end
end

# array = [0,9,1,8,5,2,7,3,6,4]
# output = "#{array} \n"
# output2 = "#{HeapSort.sort(array)} \n"
# puts output
# puts output2
