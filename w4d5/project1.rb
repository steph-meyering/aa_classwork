require 'byebug'

def my_min(arr)
  minimum = arr.first
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      if idx1 != idx2
        if el1 > el2 && el2 < minimum
          minimum = el2
        end
      end
    end
  end
  minimum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]



def my_min2(arr)
  minimum = arr.first
  arr.each do |num|
    minimum = num if num < minimum
  end
  minimum
end

# p my_min2(list)

def largest_contiguous_subsum(arr)
  largest_sum = 0
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      subsum = arr[idx1..idx2].sum
      largest_sum = subsum if subsum > largest_sum
    end
  end
  largest_sum
end

def better_sum(arr)
  largest_sum = arr.first
  current_sum = arr.first
  (1...arr.length).each do |i|
    if current_sum < 0
      current_sum = 0
    end
    current_sum += arr[i]
    if current_sum > largest_sum 
      largest_sum = current_sum
    end
  end
  largest_sum
end
list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]
# list = [5, 3, -7]
# p better_sum(list)

# def anagra  (str1, str2)
#   arr = []  
#   0...str.length).each do |i|
#     pos = [str1[i]]
#     (0...str.length).each do |j|
#       if i != j
#         pos << str[j]
#       end
#     end

#   end
# end

def anagrams2(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")
  arr1.each do |el|
    i = arr2.index(el)
    return false if i.nil?
    arr2.delete_at(i)
  end
  arr2.empty?
end



def anagrams3(str1, str2)
  str1.split("").sort == str2.split('').sort
end


def anagrams4(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  str1.each_char { |char| h1[char] += 1 }
  str2.each_char { |char| h2[char] += 1 }

  h1 == h2 
end

# p anagrams3("gizmo", "sally")    #=> false
# p anagrams3("elvis", "lives")    #=> true

def two_sum?(arr, target_sum)
  h = Hash.new(0)

  arr.each { |num| h[num] += 1 }

  h.each do |key, v|
    subtarget = target_sum - key
    if h[subtarget] != 0 && (subtarget != key || (subtarget == key && v > 1))
      return true 
      # if subtarget == key
      #   return true if v > 1
      # end
      # return true
    end 
  end
  false

end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

# h = {0 => 1, 1 => 1, 5 => 1, 7 =>1}