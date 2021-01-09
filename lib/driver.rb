require_relative 'node'
require_relative 'tree'

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
tree.pretty_print

puts "Balanced? #{tree.balanced?}"

puts "Level-order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"

tree.insert(111)
tree.insert(222)
tree.insert(333)
tree.pretty_print

puts "Balanced? #{tree.balanced?}"

tree.rebalance
tree.pretty_print

puts "Balanced? #{tree.balanced?}"

puts "Level-order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"