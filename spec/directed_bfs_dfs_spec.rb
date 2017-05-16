require 'graph_traversal'
require 'directed_graph'
require 'rspec'

a = Vertex.new('a')
b = Vertex.new('b')
c = Vertex.new('c')
d = Vertex.new('d')
e = Vertex.new('e')

ab = Edge.new(a, b)
ac = Edge.new(a, c)
bc = Edge.new(b, c)
be = Edge.new(b, e)
ce = Edge.new(c, e)
dc = Edge.new(d, c)
dc = Edge.new(e, d)

# describe 'bfs_directed' do
#   it 'returns the vertex with the proper value' do
#     expect(bfs_directed(a, 'd')).to eq(d)
#     expect(bfs_directed(d, 'a')).to eq(a)
#     expect(bfs_directed(b, 'd')).to eq(d)
#   end
#
#   it 'returns nil if the vertex with the proper value does not exist' do
#     expect(bfs_directed(a, 'f')).to be_nil
#     expect(bfs_directed(d, 1)).to be_nil
#   end
# end

describe 'dfs_directed' do
  it 'returns the vertex with the proper value' do
    expect(dfs_directed(a, 'd')).to eq(d)
    expect(dfs_directed(e, 'c')).to eq(c)
    expect(dfs_directed(b, 'd')).to eq(d)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(dfs_directed(a, 'f')).to be_nil
    expect(dfs_directed(d, 1)).to be_nil
  end
end
