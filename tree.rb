# frozen_string_literal: false

require_relative 'node'

# Class for a balanced binary search tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array, 0, array.length - 1)
  end

  def insert(key, node = @root)
    return Node.new(key) if node.nil?
    return node if node.value == key

    if key < node.value
      node.left = insert(key, node.left)
    else
      node.right = insert(key, node.right)
    end
    node
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

tree = Tree.new([-11, -7, -6, 0, 1.5, 4, 7, 18, 27.5, 30, 30.1,
                 30.11, 1500, 1501])
tree.pretty_print
tree.insert(5)
tree.insert(6)
tree.pretty_print
tree.insert(7)
tree.pretty_print
tree.insert(8)
tree.pretty_print
