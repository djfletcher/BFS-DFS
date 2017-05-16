require 'directed_graph'
require 'graph_traversal'
require 'rspec'

a = Vertex.new('a')
b = Vertex.new('b')
c = Vertex.new('c')
d = Vertex.new('d')
e = Vertex.new('e')

f = Vertex.new('f')
g = Vertex.new('g')
h = Vertex.new('h')
i = Vertex.new('i')

ab = Edge.new(a, b)
ac = Edge.new(a, c)
ae = Edge.new(a, e)
bc = Edge.new(b, c)
be = Edge.new(b, e)
ce = Edge.new(c, e)
dc = Edge.new(d, c)

fg = Edge.new(f, g)
fh = Edge.new(f, h)
fi = Edge.new(f, i)
hi = Edge.new(h, i)
gi = Edge.new(g, i)


describe 'is_cyclic?' do
  it 'returns true for cyclic graphs' do
    expect(is_cyclic?([a, b, c, d, e])).to be true
  end

  it 'returns false for acyclic graphs' do
    expect(is_cyclic?([f, g, h])).to be false
    expect(is_cyclic?([f, g, h, i])).to be true
  end
end
