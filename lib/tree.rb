class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array
    @root = root
  end

  def build_tree(array)
    array = array.sort.uniq
    @root = array[array.length/2]

    @root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end