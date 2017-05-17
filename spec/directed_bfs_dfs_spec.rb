require 'graph_traversal'
require 'directed_graph'
require 'rspec'

a = Vertex.new('a')
b = Vertex.new('b')
c = Vertex.new('c')
d = Vertex.new('d')
e = Vertex.new('e')
f = Vertex.new('f')
g = Vertex.new('g')
h = Vertex.new('h')

ab = Edge.new(a, b)
ac = Edge.new(a, c)
bc = Edge.new(b, c)
be = Edge.new(b, e)
ce = Edge.new(c, e)
dc = Edge.new(d, c)
dc = Edge.new(e, d)

fg = Edge.new(f, g)
gh = Edge.new(f, g)


describe 'bfs_directed_group' do
  it 'returns the vertex with the proper value' do
    expect(bfs_directed_group([a, b, c, d, e], 'd')).to eq(d)
    expect(bfs_directed_group([a, b, c, d, e], 'a')).to eq(a)
    expect(bfs_directed_group([a, b, c, d, e, f, g, h], 'h')).to eq(h)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(bfs_directed_group([a, b, c, d, e, f, g, h], 'z')).to be_nil
    expect(bfs_directed_group([a, b, c, d, e], 1)).to be_nil
  end
end

describe 'dfs_directed_group' do
  it 'returns the vertex with the proper value' do
    expect(dfs_directed_group([a, b, c, d, e], 'd')).to eq(d)
    expect(dfs_directed_group([a, b, c, d, e], 'a')).to eq(a)
    expect(dfs_directed_group([a, b, c, d, e, f, g, h], 'h')).to eq(h)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(dfs_directed_group([a, b, c, d, e, f, g, h], 'z')).to be_nil
    expect(dfs_directed_group([a, b, c, d, e], 1)).to be_nil
  end
end

describe 'dfs_directed_root' do
  it 'returns the vertex with the proper value' do
    expect(dfs_directed_root(a, 'd')).to eq(d)
    expect(dfs_directed_root(e, 'c')).to eq(c)
    expect(dfs_directed_root(b, 'd')).to eq(d)
  end

  it 'returns nil if the vertex with the proper value does not exist' do
    expect(dfs_directed_root(a, 'z')).to be_nil
    expect(dfs_directed_root(d, 1)).to be_nil
  end
end
