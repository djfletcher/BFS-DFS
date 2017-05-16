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

def dfs(root, val, seen = Set.new)
  return root if root.val == val
  seen.add(root)

  root.edges.each do |edge|
    neighbor = edge.vertices.reject { |v| v == root }.first
    search_result = dfs(neighbor, val, seen)
    return search_result if search_result
  end

  nil
end

# For directed graphs only
def is_cyclic?(vertices)
  levels = []
  q = Queue.new
  vertices = vertices.dup

  until vertices.empty?
    level = 1
    seen = Set.new
    q.enq(vertices.first)

    while q.length > 0
      vertex = q.deq
      seen.add(vertex)
      vertices.delete(vertex)

      vertex.out_edges.each do |edge|
        neighbor = edge.to_vertex
        return true if levels[0...level].any? { |seen_prev| seen_prev.include?(neighbor) }
        q.enq(neighbor)
        edge.destroy!
      end

      levels[level - 1] = seen
      level += 1
    end
  end

  false
end
