class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value

    @left = left
    @right = right
  end

  def <=>(other_node)
    self.value <=> other_node.value
  end

end