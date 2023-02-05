require './lib/node'

class LinkedList
  attr_accessor :head

  def initalize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    if @head == nil
      @head = node
      return node
    end
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.next_node = node
    node
  end

  def count
    count = 0
    current = @head
    while current != nil
      current = current.next_node
      count += 1
    end
    count
  end

  def to_string
    if @head == nil
      return ''
    end
    string = @head.data.to_s
    current = @head.next_node
    while current != nil
      string += " #{current.data}"
      current = current.next_node
    end
    string
  end

  def prepend(data)
    node = Node.new(data)
    node.next_node = @head if @head != nil
    @head = node
  end

  def insert(index, data)
    if index == 0
      prepend(data)
      return
    end
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    node = Node.new(data)
    node.next_node = current.next_node
    current.next_node = node
  end
end
