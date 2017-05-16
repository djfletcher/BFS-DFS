require './undirected_graph'
require 'set'

def bfs(root, val)
  return root if root.val == val
  seen = Set.new
  q = Queue.new

  q.enq(root)
  while q.length > 0
    vertex = q.deq
    seen.add(vertex)
    vertex.edges.each do |edge|
      neighbor = edge.vertices.reject { |v| v == vertex }.first
      return neighbor if neighbor.val == val
      q.enq(neighbor) unless seen.include?(neighbor)
    end
  end

  nil
end
