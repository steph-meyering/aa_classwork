require 'byebug'

class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def inspect
        "id:#{self.object_id}"
    end

    def parent=(parent_node)
        @parent.children.delete(self) unless @parent.nil?
        @parent = parent_node
        return nil if parent_node.nil?
        kids = parent_node.children 
        !kids.include?(self) ? (kids << self) : (kids.delete(self))
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "not a child!" if !child_node.is_a?(PolyTreeNode)
        child_node.parent = nil
    end
    
    
end

a = PolyTreeNode.new(1) # root
b = PolyTreeNode.new(2) # child of a
c = PolyTreeNode.new(3) # child of a

# a.parent = nil