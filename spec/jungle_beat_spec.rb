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

    it 'is initialized correctly' do
      expect(@jb.list).to be_a(LinkedList)
      expect(@jb.list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'appends 3 elements correctly' do
      @jb.append('deep doo ditt')
      expect(@jb.list.head.data).to eq('deep')
      expect(@jb.list.head.next_node.data).to eq('doo')
      expect(@jb.list.head.next_node.next_node.data).to eq('ditt')
      expect(@jb.list.to_string).to eq('deep doo ditt')
    end

    it 'appends an additional 3 elements correctly' do
      @jb.append('deep doo ditt')
      @jb.append('woo hoo shu')
      expect(@jb.list.to_string).to eq('deep doo ditt woo hoo shu')
    end
  end

  describe '#count' do

  end
end
