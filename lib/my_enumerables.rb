# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    each do |elemenent|
      yield(elemenent, index)
      index += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    return to_enum(:my_all) unless block_given?

    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    return to_enum(:my_any) unless block_given?

    my_each do |element|
      return true if yield(element)
    end
    false
  end
  def my_none?
    return to_enum(:my_none) unless block_given?

    my_each do |element|
      return false if yield(element)
    end
    true
  end
  def my_count
    return self.size unless block_given?
    count = 0
    my_each do |element|
      count += 1 if yield(element)
    end
    count
  end
def my_map
    return to_enum(:my_map) unless block_given?

   result = Array.new
    my_each do |element|
      result << yield(element)
    end
    result  
  end

  def my_inject(initialize = nil)
    return to_enum(:my_inject) unless block_given?
    if initialize == nil
      initialize = first
    end
my_each do |element|
      initialize = yield(initialize, element)
    end
    initialize
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    return to_enum(:my_each) unless block_given?

    each(&block)
    self
  end
  
end
