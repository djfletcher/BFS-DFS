require 'graph_traversal'
require 'undirected_graph'
require 'rspec'

a = Vertex.new('a')
b = Vertex.new('b')
c = Vertex.new('c')
d = Vertex.new('d')
e = Vertex.new('e')

ab = Edge.new(a, b)
ac = Edge.new(a, c)
ae = Edge.new(a, e)
bc = Edge.new(b, c)
be = Edge.new(b, e)
ce = Edge.new(c, e)
dc = Edge.new(d, c)

describe 'bfs_undirected' do
  it 'returns the vertex with the proper value' do
    expect(bfs_undirected(a, 'd')).to eq(d)
    expect(bfs_undirected(d, 'a')).to eq(a)
    expect(bfs_undirected(b, 'd')).to eq(d)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(bfs_undirected(a, 'f')).to be_nil
    expect(bfs_undirected(d, 1)).to be_nil
  end
end

describe 'dfs_undirected' do
  it 'returns the vertex with the proper value' do
    expect(dfs_undirected(a, 'd')).to eq(d)
    expect(dfs_undirected(d, 'a')).to eq(a)
    expect(dfs_undirected(b, 'd')).to eq(d)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(dfs_undirected(a, 'f')).to be_nil
    expect(dfs_undirected(d, 1)).to be_nil
  end
end
