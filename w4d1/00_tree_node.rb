require 'byebug'

class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def inspect
        "parent: #{self.parent} value: #{self.value} - children: #{self.children} "
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
        if !self.children.include?(child_node)
            raise "not a child!" 
        end
        child_node.parent = nil
    end


    def dfs(target)
        # debugger
        return self if self.value == target

        self.children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end
        return nil
    end

    def bfs(target)
        q = [self]
        until q.empty?
            el = q.shift
            return el if el.value == target
            q += el.children   #if !el.children.empty?
        end
        return nil
    end
end

