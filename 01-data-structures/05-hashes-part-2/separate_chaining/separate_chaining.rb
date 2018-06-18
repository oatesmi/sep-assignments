require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    hash_item = Node.new(key, value)
    i = index(key, size)

    if @items[i]
      @items[i].add_to_tail(hash_item)
    else
      @items[i] = LinkedList.new
      @items[i].add_to_tail(hash_item)
    end
    resize if load_factor > @max_load_factor
  end

  def [](key)
    i = index(key, size)
    temp = @items[i].head

    if temp.key === key
      return temp.value
    else
      while temp.key != key && temp.next
        temp = temp.next
      end
      temp.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    result = 0
    key.each_byte do |letter|
      result += letter
    end
    result % size
  end

  # Calculate the current load factor
  def load_factor
    count = 0.0

    @items.each_with_index do |item, i|
      if @items[i] && @items[i].head
        count += 1
        temp = @items[i].head
        while temp.next
          count += 1
          temp = temp.next
        end
      end
    end
    lf = (count / @items.size)
    lf
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(@items.size * 2)

    temp.each_with_index do |item,i|
      if temp[i]
        link = temp[i].head.next if temp[i].head.next
        index = index(temp[i].head.key, size)
        @items[index] = LinkedList.new unless @items[index]
        @items[index].add_to_tail(temp[i].head)
        while link
          index = index(link.key,size)
          @items[index] = LinkedList.new unless @items[index]
          @items[index].add_to_tail(link)
          link = link.next
        end
      end
    end
  end

  def print_state
    @items.each_with_index do |item,i|
      if @items[i]
        puts "#{@items[i].head.value}'s Bucket:"
        puts "--------------------"
        puts "#{@items[i].print}"
        puts "--End of Bucket----"
      end
    end
    load_factor
  end 
end
