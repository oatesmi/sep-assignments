module MergeSort
  def self.sort(collection)
    if collection.length <= 1
      collection
    else
      mid = (collection.length / 2).floor
      left = self.sort(collection[0..mid - 1])
      right = self.sort(collection[mid..collection.length])
      merge(left, right)
    end
  end

  def self.merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end
end
