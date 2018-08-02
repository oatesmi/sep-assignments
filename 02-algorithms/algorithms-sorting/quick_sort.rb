def quick_sort(collection, low = 0, high = (collection.length - 1))

  if low < high
    pivot = partition(collection, low, high)
    quick_sort(collection, low, pivot - 1)
    quick_sort(collection, pivot + 1, high)
  end
  return collection
end

def partition(collection, low, high)
  i = low
  j = high + 1
  pivot = collection[low]

  while true
    begin
      i += 1
      break if i == high
    end while collection[i] < pivot

    begin
      j -= 1
      break if j == low
    end while collection[j] > pivot

    break if i >= j

    temp = collection[i]
    collection[i] = collection[j]
    collection[j] = temp
  end

  temp = collection[low]
  collection[low] = collection[j]
  collection[j] = temp
  return j
end

array = %w(9 1 2 8 3 7 4 6 5)
puts array
puts "\n"
puts quick_sort(array)
