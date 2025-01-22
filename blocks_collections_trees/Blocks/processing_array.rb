class ArrayProcessor
  def initialize(array)
    @array = array.dup.freeze
  end

  def elements
    @array
  end
end

 def custom_flat_map
    result = []
    @array.each do |element|
      result.concat(yield(element))
    end
    result
  end
end

def custom_one?
    count = 0
    @array.each do |element|
      count += 1 if yield(element)
      return false if count > 1
    end
    count == 1
  end
end

def custom_inject(initial = nil)
    accumulator = initial || @array.first
    start_index = initial.nil? ? 1 : 0
    @array[start_index..].each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

def custom_min_by
    return nil if @array.empty?
    min_element = @array.first
    min_value = yield(min_element)

    @array.each do |element|
      current_value = yield(element)
      if current_value < min_value
        min_element = element
        min_value = current_value
      end
    end
    min_element
  end

  def custom_find
    @array.each do |element|
      return element if yield(element)
    end
    nil
  end
end