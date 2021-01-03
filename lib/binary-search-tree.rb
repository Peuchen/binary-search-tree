require_relative 'node'
require_relative 'tree'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(array)

puts "BEFORE INSERTION"
tree.pretty_print

tree.insert(12)

puts "AFTER INSERTION"
tree.pretty_print

tree.delete(4)

puts "AFTER DELETION"
tree.pretty_print

p tree.find(5)