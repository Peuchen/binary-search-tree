require_relative 'node'
require_relative 'tree'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(array)
p tree.build_tree(array)
tree.pretty_print