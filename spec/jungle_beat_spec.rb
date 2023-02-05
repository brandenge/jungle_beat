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
end
