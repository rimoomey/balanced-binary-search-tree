# frozen_string_literal: false

# Class for binary tree node--contains left and right branches
class Node
  attr_accessor :value, :left, :right

  def initalize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
