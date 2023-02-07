require 'rspec'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

RSpec.describe JungleBeat do
  before(:each) do
    @jb = JungleBeat.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@jb).to be_a(JungleBeat)
    end

    it 'initializes @list to an empty LinkedList' do
      expect(@jb.list).to be_a(LinkedList)
      expect(@jb.list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'appends 1 beat at once' do
      @jb.append('deep')
      expect(@jb.list.head.data).to eq('deep')
      expect(@jb.list.head.next_node).to eq(nil)
    end

    it 'appends 2 beats at once' do
      @jb.append('deep doo')
      expect(@jb.list.head.data).to eq('deep')
      expect(@jb.list.head.next_node.data).to eq('doo')
      expect(@jb.list.head.next_node.next_node).to eq(nil)
    end

    it 'appends 3 beats at once' do
      @jb.append('deep doo ditt')
      expect(@jb.list.head.data).to eq('deep')
      expect(@jb.list.head.next_node.data).to eq('doo')
      expect(@jb.list.head.next_node.next_node.data).to eq('ditt')
      expect(@jb.list.to_string).to eq('deep doo ditt')
    end

    it 'appends an additional 3 beats' do
      @jb.append('deep doo ditt')
      @jb.append('woo hoo shu')
      expect(@jb.list.to_string).to eq('deep doo ditt woo hoo shu')
    end
  end

  describe '#count' do
    it 'has a count of 0 when its list is empty' do
      expect(@jb.count).to eq(0)
    end

    it 'has a count of 1 when its list has 1 node' do
      @jb.append('deep')
      expect(@jb.count).to eq(1)
    end

    it 'has a count of 2 when its list has 2 nodes' do
      @jb.append('deep doo')
      expect(@jb.count).to eq(2)
    end

    it 'has a count of 3 when its list has 3 nodes' do
      @jb.append('deep doo ditt')
      expect(@jb.count).to eq(3)
    end

    it 'has a count of 6 when its list has 6 nodes' do
      @jb.append('deep doo ditt')
      @jb.append('woo hoo shu')
      expect(@jb.count).to eq(6)
    end
  end

  describe '#play' do
    it 'returns the count' do
      @jb.append('deep doo')
      expect(@jb.play).to eq(2)
    end

    it 'returns a different count' do
      @jb.append('woo hoo shu')
      expect(@jb.play).to eq(3)
    end
  end

  describe '#all' do
    it "returns a string of the nodes' data in the list" do
      @jb.append('deep doo ditt')
      expect(@jb.all).to eq(@jb.list.to_string)
    end

    it "returns a different string of the nodes' data in the list" do
      @jb.append('woo hoo shu')
      expect(@jb.all).to eq(@jb.list.to_string)
    end
  end
end
