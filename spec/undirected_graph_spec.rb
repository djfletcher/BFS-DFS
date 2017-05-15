require 'rspec'
require 'undirected_graph'

describe Vertex do
  describe '#initialize' do
    subject(:vertex) { Vertex.new(5) }

    it 'stores a value' do
      expect(vertex.val).to eq(5)
    end

    it 'initially sets edges as an empty array' do
      expect(vertex.edges).to eq([])
    end
  end
end

describe Edge do
  let(:v1) { Vertex.new('v1') }
  let(:v2) { Vertex.new('v2') }
  subject(:edge) { Edge.new(v1, v2) }

  describe '#initialize' do
    it 'stores two vertices in an array' do
      expect(edge.vertices).to be_an_instance_of(Array)
      expect(edge.vertices).to include(v1)
      expect(edge.vertices).to include(v2)
    end
  end
end
