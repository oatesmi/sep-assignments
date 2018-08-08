require_relative './insertion_sort'

module BucketSort
  include InsertionSort

  def self.sort(collection, bucket_size = 5)
    return if collection.empty?

    min_value = collection.min
    max_value = collection.max

    #create buckets
    bucket_count = ((max_value - min_value) / bucket_size).floor + 1
    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    #split original array into buckets
    (0..collection.length - 1).each do |i|
      buckets[((collection[i] - min_value) / bucket_size).floor].push(collection[i])
    end

    #sort buckets and place back into original array
    collection.clear
    (0..buckets.length - 1).each do |i|
      InsertionSort.sort buckets[i]
      buckets[i].each do |value|
        collection.push(value)
      end
    end
    collection
  end
end
