require 'rspec'
require 'directed_graph'
require 'graph_traversal'

describe 'TopologicalSort' do
  let(:v1) { Vertex.new("Wash Markov") }
  let(:v2) { Vertex.new("Feed Markov") }
  let(:v3) { Vertex.new("Dry Markov") }
  let(:v4) { Vertex.new("Brush Markov") }
  let(:vertices) { [] }

  before(:each) do
    vertices.push(v1, v2, v3, v4)
    Edge.new(v1, v2)
    Edge.new(v1, v3)
    Edge.new(v2, v4)
    Edge.new(v3, v4)
  end

  it "sorts the vertices using dfs" do
    solutions = [
      [v1, v2, v3, v4],
      [v1, v3, v2, v4]
    ]

    1.times do
      expect(solutions).to include(dfs_topological_sort(vertices.shuffle))
    end
  end

  it "sorts the vertices using bfs" do
    solutions = [
      [v1, v2, v3, v4],
      [v1, v3, v2, v4]
    ]

    1.times do
      expect(solutions).to include(bfs_topological_sort(vertices.shuffle))
    end
  end
end
