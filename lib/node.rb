class Node
  include Comparable
  attr_accessor :value

  def initialize(value, left_child, right_child)
    @value = value

    @left_child = left_child
    @right_child = right_child
  end

  def <=>(other_node)
    self.value <=> other_node.value
  end

end