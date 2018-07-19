require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp = root

    if node.rating < root.rating
      if temp.left
        insert(temp.left, node)
      else
        temp.left = node
      end
    elsif node.rating > root.rating
      if temp.right
        insert(temp.right, node)
      else
        temp.right = node
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data === nil

    if root.title === data
      return root
    elsif root.left
      find(root.left, data)
    else
      find(root.right, data)
    end
  end

  def delete(root, data)
    temp = find(root, data)

    if temp === nil
      return nil
    else
      temp.title = nil
      temp.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    list = [@root]
    while !list.empty?
      if list[0].left
        list.push(list[0].left)
      end
      if list[0].right
        list.push(list[0].right)
      end
      puts "#{list[0].title}: #{list[0].rating}\n"
      list.shift
    end
  end
end
