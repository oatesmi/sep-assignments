require 'benchmark'
require_relative './bucket_sort'
require_relative './heap_sort'
require_relative './bubble_sort'
require_relative './insertion_sort'
require_relative './merge_sort'
require_relative './quick_sort'
require_relative './selection_sort'

include Benchmark

unsorted = [0,9,1,8,2,7,5,3,6,4]
array = [0,9,1,8,2,7,5,3,6,4]
bucketsort = BucketSort.sort(array)
heapsort = HeapSort.sort(array)
bubblesort = BubbleSort.sort(array)
insertionsort = InsertionSort.sort(array)
mergesort = MergeSort.sort(array)
quicksort = QuickSort.sort(array)
selectionsort = SelectionSort.sort(array)

puts "   Bucket Sort, unsorted: #{unsorted} \n"
puts "     Bucket Sort, sorted: #{bucketsort} \n\n"
puts "     Heap Sort, unsorted: #{unsorted} \n"
puts "       Heap Sort, sorted: #{heapsort} \n\n"
puts "   Bubble Sort, unsorted: #{unsorted} \n"
puts "     Bubble Sort, sorted: #{bubblesort} \n\n"
puts "Insertion Sort, unsorted: #{unsorted} \n"
puts "  Insertion Sort, sorted: #{insertionsort} \n\n"
puts "    Merge Sort, unsorted: #{unsorted} \n"
puts "      Merge Sort, sorted: #{mergesort} \n\n"
puts "    Quick Sort, unsorted: #{unsorted} \n"
puts "      Quick Sort, sorted: #{quicksort} \n\n"
puts "Selection Sort, unsorted: #{unsorted} \n"
puts "  Selection Sort, sorted: #{selectionsort} \n\n"

n = 50
Benchmark.bmbm do |x|
  x.report("   Bucket sort 50 items:") {
    BucketSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("     Heap sort 50 items:") {
    HeapSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("    Quick sort 50 items:") {
    QuickSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("   Bubble sort 50 items:") {
    BubbleSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("Insertion sort 50 items:") {
    InsertionSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("    Merge sort 50 items:") {
    MergeSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("Selection sort 50 items:") {
    SelectionSort.sort(50.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("   Bucket sort 5_000 items:") {
    BucketSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("     Heap sort 5_000 items:") {
    HeapSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("    Quick sort 5_000 items:") {
    QuickSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("   Bubble sort 5_000 items:") {
    BubbleSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("Insertion sort 5_000 items:") {
    InsertionSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("    Merge sort 5_000 items:") {
    MergeSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
  x.report("Selection sort 5_000 items:") {
    SelectionSort.sort(5_000.times.map{ 1 + Random.rand(0..1000) })
  }
end
