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

  def delete(key, node = @root)
    return if node.left.nil? && node.right.nil?

    if key == node.left.value
      if node.left.left.nil? && node.left.right.nil?
        node.left = nil
      elsif node.left.left.nil?
        node.left = node.left.right
      elsif node.left.right.nil?
        node.left = node.left.left
      else
        successor = inorder_successor(node.left)
        successor.left = node.left.left
        node.left.right.left = nil
        successor.right = node.left.right
        node.left = successor
      end
    elsif key == node.right.value
      if node.right.left.nil? && node.right.right.nil?
        node.right = nil
      elsif node.right.left.nil?
        node.right = node.right.right
      elsif node.right.right.nil?
        node.right = node.right.left
      else
        successor = inorder_successor(node.right)
        successor.left = node.right.left
        node.right.right.left = nil
        successor.right = node.right.right
        node.right = successor
      end
    elsif key < node.value
      delete(key, node.left)
    else
      delete(key, node.right)
    end
    nil
  end

  def find(key, node = @root)
    return if node.nil?

    if key < node.value
      find(key, node.left)
    elsif key > node.value
      find(key, node.right)
    else
      node
    end
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
    return node if node.left.nil?

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

tree = Tree.new([-10, -9, -8, -7, -6, -5, -3, -2.5, -2.25, -2, -1, 1, 3, 4, 6])
tree.pretty_print
tree.delete(1)
tree.pretty_print
tree.insert(1)
tree.pretty_print
puts tree.find(-7)
