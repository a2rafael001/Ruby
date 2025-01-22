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