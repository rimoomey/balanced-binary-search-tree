# frozen_string_literal: false

require_relative 'node'

# Class for a balanced binary search tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array, 0, array.length - 1)
  end

  private

  def build_tree(array, beginning, last)

    if beginning < last
      mid = (beginning + last) / 2

      current_node = Node.new(array[mid])
      current_node.left = build_tree(array[0..mid - 1], 0, mid - 1)
      current_node.right = build_tree(array[mid + 1..], mid + 1, array.length - 1)
    end

      current_node
  end
end

Tree.new([0, 1, 2, 3, 4])
