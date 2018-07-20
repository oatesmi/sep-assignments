def binary_search_recursive(collection, target)
  low = 0
  high = collection.length - 1
  mid = (low + high) / 2

  if collection[mid] == target
    return collection[mid]
  elsif collection[mid] > target
    high = mid - 1
    binary_search_recursive(collection[low..mid], target)
  elsif collection[mid] < target
    low = mid + 1
    binary_search_recursive(collection[mid..high], target)
  end
end


ary = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p binary_search_recursive(ary, 2)
