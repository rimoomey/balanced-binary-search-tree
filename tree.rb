# frozen_string_literal: false

require_relative 'node'

# Class for a balanced binary search tree
class Tree
  attr_accessor :root

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

  def inorder_successor(node = @root)
    unless node.right.nil?
      right_subtree = node.right
      return minimum_value(right_subtree)
    end
    minimum_value(node)
  end

  def minimum_value(node = @root)
    return nil if node.nil?
    return node.value if node.left.nil?

    minimum_value(node.left)
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

tree = Tree.new([-8, -7, -6, -5, -4, -3, -2, -1, 1, 3, 4, 6])
tree.pretty_print
puts tree.minimum_value
puts tree.inorder_successor(tree.root.right)
