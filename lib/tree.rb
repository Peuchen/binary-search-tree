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

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end