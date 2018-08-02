def selecton_sort(collection)
  length = collection.length
  for i in 0..length - 2
    min_index = i
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        min_index = j
      end
    end

    temp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = temp
  end
  collection
end

# array = %w(1 9 2 8 3 7 4 6 5)
# puts array
# puts "\n"
# puts selecton_sort(array)
