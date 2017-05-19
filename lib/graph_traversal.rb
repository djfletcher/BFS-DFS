require 'set'
require 'byebug'

def bfs_undirected(root, val)
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


def dfs_undirected(root, val, seen = Set.new)
  return root if root.val == val
  seen.add(root)

  root.edges.each do |edge|
    neighbor = edge.vertices.reject { |v| v == root }.first
    if !seen.include?(neighbor)
      search_result = dfs_undirected(neighbor, val, seen)
      return search_result if search_result
    end
  end

  nil
end


def dfs_directed_root(root, val, seen = Set.new)
  return root if root.val == val
  seen.add(root)

  root.out_edges.each do |edge|
    neighbor = edge.to_vertex
    if !seen.include?(neighbor)
      search_result = dfs_directed_root(neighbor, val, seen)
      return search_result if search_result
    end
  end

  nil
end


def bfs_directed_group(vertices, val)
  seen = Set.new
  q = Queue.new

  vertices.each do |vertex|
    return vertex if vertex.val == val
    seen.include?(vertex) ? next : q.enq(vertex)

    until q.empty?
      v = q.deq
      seen.add(v)
      v.out_edges.each do |edge|
        neighbor = edge.to_vertex
        return neighbor if neighbor.val == val
        q.enq(neighbor) unless seen.include?(neighbor)
      end
    end
  end

  nil
end


def dfs_directed_group(vertices, val, seen = Set.new)
  return nil if vertices.empty?
  vertices.each do |vertex|
    return vertex if vertex.val == val
    seen.include?(vertex) ? next : seen.add(vertex)
    neighbors = vertex.out_edges.map(&:to_vertex)
    search_result = dfs_directed_group(neighbors, val, seen)
    return search_result if search_result
  end

  nil
end


def dfs_topological_sort(vertices, seen = Set.new, sorted = [])
  return sorted if vertices.empty?
  vertices.each do |vertex|
    next if seen.include?(vertex)
    seen.add(vertex)
    neighbors = []
    vertex.out_edges.each do |edge|
      neighbors << edge.to_vertex if !seen.include?(edge.to_vertex)
    end

    dfs_topological_sort(neighbors, seen, sorted)
    sorted.unshift(vertex)
  end

  sorted
end


def bfs_topological_sort(vertices)
  sorted = []
  q = Queue.new
  vertices = vertices.dup

  until vertices.empty?
    vertices.each { |v| q.enq(v) if v.in_edges.empty? }

    until q.empty?
      vertex = q.deq
      sorted << vertices.delete(vertex)
      # as each first out_edge is destroyed a new one shifts to first index
      vertex.out_edges.length.times { vertex.out_edges.first.destroy! }
    end
  end

  sorted
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


def is_cyclic?(vertices, seen = Set.new, sorted = [])
  return false if vertices.empty?
  vertices.each do |vertex|
    seen.include?(vertex) ? next : seen.add(vertex)
    neighbors = []
    vertex.out_edges.each do |edge|
      neighbors << edge.to_vertex unless seen.include?(edge.to_vertex)
    end

    is_cyclic?(neighbors, seen, sorted)
    if sorted.include?(vertex)
      return true
    else
      sorted.unshift(vertex)
      return false
    end
  end
end




















def bfs(root, val)
  return root if root.val == val
  seen = Set.new
  q = Queue.new

  q.enq(root)
  until q.empty?
    v = q.deq
    seen.add(v)
    v.out_edges.each do |edge|
      neighbor = edge.to_vertex
      return neighbor if neighbor.val == val
      q.enq(neighbor) unless seen.include?(neighbor)
    end
  end

  nil
end


def dfs(root, val, seen = Set.new)
  return root if root.val == val
  seen.add(root)
  root.out_edges.each do |edge|
    if !seen.include?(edge.to_vertex)
      search_result = dfs(edge.to_vertex, val, seen)
      return search_result if search_result
    end
  end

  nil
end
