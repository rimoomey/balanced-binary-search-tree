# frozen_string_literal: false

# Class for binary tree node--contains left and right branches
class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(other)
    @value <=> other.value
  end
end

node1 = Node.new(5)
node2 = Node.new(6)
node3 = Node.new(7)

puts node1 > node2
puts node2 > node1
puts node3.between?(node1, node2)
