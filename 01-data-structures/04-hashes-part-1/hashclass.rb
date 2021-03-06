require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hash_item = HashItem.new(key, value)
    i = index(key, size)

    if @items[i] === nil
      @items[i] = hash_item
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif (@items[i].key === key) && (@items[i].value != value)
      self.resize
      @items[i] = value
    end
  end


  def [](key)
    if @items[index(key, size)] != nil && @items[index(key, size)].key === key
      @items[index(key, size)].value
    end
  end

  def resize
    temp = @items
    @items = Array.new(temp.size * 2)

    temp.each do |item|
      unless item === nil
        self[item.key] = item.value
      end
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
