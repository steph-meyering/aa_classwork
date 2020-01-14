require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  #sum everything in array
  #then call integer hash on that sum
  def hash
    debugger
    return 666.hash if self.empty?
    chars = ('A'..'z').to_a + ('!'..'?').to_a
    self.inject(0) do |acc, el| 
      el = chars.index(el) unless el.is_a?(Integer)
      acc -= chars.index(el)
    end.hash
  end
end

class String
  def hash
    hash = 0
    chars = (0..9).to_a + ('A'..'z').to_a + ('!'..'?').to_a
    self.chars.each_with_index do |el, i|
      i.even? ? hash -= chars.index(el) : hash += chars.index(el)
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    k_hash = 0
    v_hash = 1
    self.each do |k,v|
      k_hash += k.hash
      v_hash += v.hash
    end
    k_hash - v_hash
  end
end
