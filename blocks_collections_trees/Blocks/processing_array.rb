class ArrayProcessor
  def initialize(array)
    @array = array.dup.freeze
  end

  def elements
    @array
  end
end
