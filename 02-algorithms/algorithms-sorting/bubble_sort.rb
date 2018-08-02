def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false

    (n - 1 ).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end


array = %w(9 1 2 8 3 7 4 6 5)
puts array
puts "\n"
puts bubble_sort(array)
