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

    it 'adds itself to each vertex\'s list of edges' do
      expect(v1.edges).to include(edge)
      expect(v2.edges).to include(edge)
    end
  end
end

describe UndirectedGraph do
  let(:v1) { Vertex.new('v1') }
  let(:v2) { Vertex.new('v2') }
  let(:v3) { Vertex.new('v3') }
  let(:v4) { Vertex.new('v4') }

  let(:e1) { Edge.new(v1, v2) }
  let(:e2) { Edge.new(v1, v3) }
  let(:e3) { Edge.new(v2, v4) }
  let(:e4) { Edge.new(v3, v4) }
  let(:e5) { Edge.new(v1, v4) }



end
