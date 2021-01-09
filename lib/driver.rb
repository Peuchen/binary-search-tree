require_relative 'node'
require_relative 'tree'

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
tree.pretty_print

# 2. Confirm that the tree is balanced by calling `#balanced?`
puts "Balanced? #{tree.balanced?}"

# 3. Print out all elements in level, pre, post, and in order
puts "Level-order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"

# 4. try to unbalance the tree by adding several numbers > 100
tree.insert(111)
tree.insert(222)
tree.insert(333)
tree.pretty_print

# 5. Confirm that the tree is unbalanced by calling `#balanced?`
puts "Balanced? #{tree.balanced?}"

# 6. Balance the tree by calling `#rebalance`
tree.rebalance

# 7. Confirm that the tree is balanced by calling `#balanced?`
puts "Balanced? #{tree.balanced?}"

# 8. Print out all elements in level, pre, post, and in order
puts "Level-order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"