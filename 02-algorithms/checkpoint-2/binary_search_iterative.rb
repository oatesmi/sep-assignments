def binary_search_iterative(collection, target)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] > target
      high = mid - 1
    elsif collection[mid] < target
      low = mid + 1
    else
      return collection[mid]
    end
  end
  return nil
end


ary = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts binary_search_iterative(ary, 9)
