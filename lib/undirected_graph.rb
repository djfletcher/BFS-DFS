require 'byebug'

class Vertex
  attr_accessor :val, :edges, :weight

  def initialize(val)
    @val = val
    @edges = []
    @weight = 1
  end
end


class Edge
  attr_accessor :vertices

  def initialize(v1, v2)
    @vertices = [v1, v2]
    v1.edges << self
    v2.edges << self
  end

  def destroy!
    @vertices.each { |v| v.edges.delete(self) }
    @vertices = nil
    self
  end
end


class UndirectedGraph
  attr_accessor :vertices, :edges

  def initialize(vertices = [], edges = [])
    @vertices = vertices
    @edges = edges
  end

  def insert_vertex(vertex)
    if !@vertices.include?(vertex)
      @vertices << vertex
      @edges.push(*vertex.edges)
    end

    vertex
  end

  def insert_edge(edge)
    if !@edges.include?(edge)
      @edges << edge
      @vertices.push(*edge.vertices)
    end

    edge
  end

  def remove_vertex(vertex)
    if @vertices.include?(vertex)
      @vertices.delete(vertex)
      vertex.edges.each do |edge|
        @edges.delete(edge)
      end
    end

    vertex
  end

  def remove_edge(edge)
    @edges.delete(edge)
  end
end
