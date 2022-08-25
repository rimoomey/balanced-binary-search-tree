# frozen_string_literal: false

require_relative 'node'

# Class for a balanced binary search tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array, 0, array.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def build_tree(array, beginning, last)
    return nil if beginning > last

    mid = (beginning + last) / 2

    current_node = Node.new(array[mid])
    current_node.left = build_tree(array, beginning, mid - 1)
    current_node.right = build_tree(array, mid + 1, last)

    current_node
  end
end

tree = Tree.new([0, 1, 2, 3, 4, 5, 6])
tree.pretty_print
