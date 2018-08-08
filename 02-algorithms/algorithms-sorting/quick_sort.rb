module QuickSort
  def self.sort(collection, low = 0, high = collection.length)

    if low < high
      pivot = partition(collection, low, high)
      self.sort(collection, low, pivot - 1)
      self.sort(collection, pivot + 1, high)
    end
    return collection
  end

  private

  def self.partition(collection, low, high)
    i = low
    j = high
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
end
