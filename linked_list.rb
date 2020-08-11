class Node
  attr_accessor :next, :data

  def initialize(data)
    @next = nil
    @data = data
  end
end

class LinkedList
  attr_accessor :name, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
    @size += 1
  end

  def head
    @head.data
  end

  def tail
    @tail.data
  end

  def at(index)
    count = 0
    current_node = @head

    while count < index && current_node.next != nil
      current_node = current_node.next
      count += 1
    end

    puts current_node.data
    current_node if count == index
  end

  def pop
    @tail = at(size - 2)
    @tail.next = nil
    @size -= 1
  end

  def contains?(value)
    for i in 0..size-1
      return true if value == at(i).data
    end
    false
  end

  def find(value)
    for i in 0..size-1
      return i if value == at(i).data
    end
    nil
  end

  def to_s
    current_node = @head
    until current_node == nil
      puts current_node.data
      current_node = current_node.next
    end
    puts "nil"
  end
end



new_list = LinkedList.new
new_list.append("There")
new_list.prepend("Hello")
new_list.append("General")
new_list.append("Kenobi")
puts new_list.head
puts new_list.tail
puts new_list.size
new_list.at(2)
puts new_list.contains?("General")
puts new_list.find("General")
new_list.pop
puts new_list.size
new_list.to_s