require 'bfs'
require 'undirected_graph'
require 'rspec'

describe 'bfs' do
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

  it 'returns the vertex with the proper value' do
    expect(bfs(a, 'd')).to eq(d)
    expect(bfs(d, 'a')).to eq(a)
    expect(bfs(b, 'd')).to eq(d)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(bfs(a, 'f')).to be_nil
    expect(bfs(d, 1)).to be_nil
  end

end
