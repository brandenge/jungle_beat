require 'rspec'
require_relative '../lib/linked_list'
require_relative '../lib/node'

RSpec.describe LinkedList do
  data_1 = 'plop'
  data_2 = 'doop'
  data_3 = 'deep'

  before(:each) do
    @linked_list = LinkedList.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@linked_list).to be_a(LinkedList)
    end
  end

  describe '#append' do
    it 'appends 1 node' do
      node = @linked_list.append(data_1)

      expect(@linked_list.head).to be(node)
      expect(@linked_list.head.data).to eq(data_1)
      expect(@linked_list.head.next_node).to eq(nil)
    end

    it 'appends 2 nodes' do
      node_1 = @linked_list.append(data_1)
      node_2 = @linked_list.append(data_2)

      expect(@linked_list.head).to be(node_1)
      expect(@linked_list.head.next_node).to be(node_2)

      expect(@linked_list.head.data).to eq(data_1)
      expect(@linked_list.head.next_node.data).to eq(data_2)
      expect(@linked_list.head.next_node.next_node).to eq(nil)
    end

    it 'appends 3 nodes' do
      node_1 = @linked_list.append(data_1)
      node_2 = @linked_list.append(data_2)
      node_3 = @linked_list.append(data_3)

      expect(@linked_list.head).to be(node_1)
      expect(@linked_list.head.next_node).to be(node_2)
      expect(@linked_list.head.next_node.next_node).to be(node_3)

      expect(@linked_list.head.data).to eq(data_1)
      expect(@linked_list.head.next_node.data).to eq(data_2)
      expect(@linked_list.head.next_node.next_node.data).to eq(data_3)
      expect(@linked_list.head.next_node.next_node.next_node).to eq(nil)
    end

  end

  describe '#count' do
    it 'starts with 0 nodes counted' do
      expect(@linked_list.count).to eq(0)
    end

    it 'counts 1 node' do
      @linked_list.append(data_1)

      expect(@linked_list.count).to eq(1)
    end

    it 'counts 2 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)

      expect(@linked_list.count).to eq(2)
    end

    it 'counts 3 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)

      expect(@linked_list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'returns an empty string for an empty linked list' do
      expect(@linked_list.to_string).to eq('')
    end

    it 'returns the proper string for 1 node' do
      @linked_list.append(data_1)
      expect(@linked_list.to_string).to eq("#{data_1}")
    end

    it 'returns the proper string for 2 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2}")
    end

    it 'returns the proper string for 3 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2} #{data_3}")
    end
  end
end
