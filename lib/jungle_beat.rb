require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string_data)
    data_array = string_data.split(' ')
    data_array.each do |data|
      @list.append(data)
    end
  end

  def count
    count = 0
    current = @list.head
    while current != nil
      current = current.next_node
      count += 1
    end
    count
  end

  def play
    command = 'say -r 500 -v Boing'
    beats = @list.to_string
    `#{command} #{beats}`
    "#{command} #{beats}"
  end
end
