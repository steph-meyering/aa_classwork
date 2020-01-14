require "byebug"

class MaxIntSet
  attr_reader :store
  
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
      true
    else
      raise 'Out of bounds'
      false
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if (count >= num_buckets)

    unless include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -=1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  attr_accessor :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    #create twice as many buckets
    #check the num so it knows the resize
    #move elements into correct bucket (% by the new size) and assign
    new_size = num_buckets * 2
    new_store = Array.new(new_size) { Array.new }
    @store.each do |bucket|
      bucket.each do |val|
        index = val % new_size
        new_store[index] << val
      end
    end
    self.store = new_store   
  end
end
