class Tree
	attr_accessor :children, :node_name

	def initialize(name, children=[])
		@children = children
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new("Ruby", [Tree.new("reia"), Tree.new("MacRuby")])
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts
puts


class Tree2
	attr_accessor :children, :node_name

	def initialize(h={})
		@node_name = h.keys.first
		@children = []
		h[@node_name].each { |n, c| @children.push(Tree.new(n => c)) }
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

test_tree2 = Tree2.new('grandpa' => {'dad' => {'child1' => {}, 'chuild2' => {}}, 'uncle' => {'chiild3' => {}, 'child4' => {} }})
test_tree2.visit_all {|node| puts node.node_name}