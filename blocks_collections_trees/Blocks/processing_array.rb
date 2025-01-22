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