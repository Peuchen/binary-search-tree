class Tree
  attr_accessor :data, :root

  def initialize(array = [])
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = array.length / 2

    node = Node.new(array[mid])
    node.left = build_tree(array[0...mid])
    node.right = build_tree(array[(mid+1)..-1])

    node
  end

  def insert(value, node = root)
    return Node.new(value) if node.nil?
    return nil if node.value == value

    if value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(value, node.left)
      end
    else
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(value, node.right)
      end
    end

    node
  end

  def delete(value, node = root, previous = root)
    return node if node.nil?

    if value < node.value
      previous = node
      delete(value, node.left, previous)
    elsif value > node.value
      previous = node
      delete(value, node.right, previous)
    else
      if node.left.nil? && node.right.nil?
        delete_node_without_children(node, previous)
      elsif node.left.nil?
        delete_node_with_right_child(node, previous)
      elsif node.right.nil?
        delete_node_with_left_child(node, previous)
      else
        delete_node_with_two_children(node, previous)
      end
    end
    node
  end

  def delete_node_without_children(node, previous)
    if previous.left.nil? == false && previous.left.value == node.value
      previous.left = nil
    else
      previous.right = nil
    end
  end

  def delete_node_with_right_child(node, previous)
    if previous.left.nil? == false && previous.left.value == node.value
      previous.left = node.right
    else
      previous.right = node.right
    end
  end

  def delete_node_with_left_child(node, previous)
    if previous.left.nil? == false && previous.left.value == node.value
      previous.left = node.left
    else
      previous.right = node.left
    end
  end

  def delete_node_with_two_children(node, previous)
    temp = lowest_subtree_value(node.right)
    node.value = temp.value
    node.right = delete(temp.value, node.right)
  end

  def lowest_subtree_value(node = root)
    current_node = node
    while current_node && current_node.left.nil? == false
      current_node = current_node.left
    end
    current_node
  end

  def find(value, node = root)
    if value < node.value
      find(value, node.left)
    elsif value > node.value
      find(value, node.right)
    else
      node
    end
  end

  def level_order(node = root, queue = [], output = [])
    return if node.nil?
    queue << node

    until queue.empty?
      current = queue.first
      queue.shift
      output << current.value

      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end

    output
  end

  # def rec_level_order(node = root, queue = [], output = [])
  #   return if node.nil?
  #   queue << node

  #   current = queue.first
  #   queue.shift
  #   output << current.value

  #     rec_level_order(current.left, queue, output) unless current.left.nil?
  #     rec_level_order(current.right, queue, output)  unless current.right.nil?


  #   output
  # end

  def inorder(node = root, output = [])
    return if node.nil?
    inorder(node.left, output) unless node.left.nil?
    output << node.value
    inorder(node.right, output) unless node.right.nil?

    output
  end

  def preorder(node = root, output = [])
    return if node.nil?
    output << node.value
    preorder(node.left, output) unless node.left.nil?
    preorder(node.right, output) unless node.right.nil?

    output
  end

  def postorder(node = root, output = [])
    return if node.nil?
    postorder(node.left, output) unless node.left.nil?
    postorder(node.right, output) unless node.right.nil?
    output << node.value

    output
  end

  def height(node)
    node = find(node) if node.is_a? Numeric
    return -1 if node.nil?
    return find_max(height(node.left), height(node.right)) + 1
  end

  def find_max(a, b)
    if a >= b
      return a
    else
      return b
    end
  end

  def depth(value, node = root, level = 0)
    if value < node.value
      level += 1
      depth(value, node.left, level)
    elsif value > node.value
      level += 1
      depth(value, node.right, level)
    else
      level
    end
  end

  def balanced?(node = root)
    if (height(node.left) - height(node.right)).between?(-1, 1)
      balanced?(node.left) unless node.left.nil?
      balanced?(node.right) unless node.right.nil?
      return true
    else
      return false
    end
  end

  def rebalance
    array = self.level_order
    self.data = array.sort.uniq
    self.root = build_tree(data)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end