class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array.sort.uniq
    @root = root
  end

  def build_tree
    n = array.length

    # 1. Initialize start = 0, end = n - 1
    # 2. mid = (start + end)/2
    # 3. Create a tree node with mid as @root
    # 4. Recursively:
      # 4.1 Calculate mid of left subarray and make it root of left subtree
      # 4.2 Calculate mid of right subarray and make it root of right subtree


    left_array = array[0..n/2-1]
    right_array = array[n/2+1..-1]

    @root = Node.new(array[n/2], left_array, right_array)

    @root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end