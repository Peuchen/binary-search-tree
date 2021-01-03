class Tree
  attr_reader :data, :root

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
        node = node.right
        node
      elsif node.right.nil?
        node = node.left
        node
      end
    end
  end

  def delete_node_without_children(node, previous)
    if previous.left.nil? == false && previous.left.value == node.value
      previous.left = nil
    else
      previous.right = nil
    end
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end