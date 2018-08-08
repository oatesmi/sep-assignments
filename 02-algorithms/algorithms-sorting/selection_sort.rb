module SelectionSort
  def self.sort(collection)
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
end
