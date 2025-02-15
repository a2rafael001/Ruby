class ArrayProcessor


  def initialize(array)
    @array = array.dup.freeze #Копирует и замораживает массив, чтобы он был нельзя изменить 
  end

  def elements
    @array
  end

#Проверяет, соответствуют ли все элементы блоку
def all?
    @array.each { |element| return false unless yield(element) }
    true
  end

#Применяет блок и разворачивает массив
 def flat_map
    result = []
    @array.each do |element|
      result.concat(yield(element))
    end
    result
  end

#Проверяет, есть ли ровно один элемент, удовлетворяющий блоку
def one?
    count = 0
    @array.each do |element|
      count += 1 if yield(element)
      return false if count > 1
    end
    count == 1
  end

#Выполняет свёртку массива
def inject(initial = nil)
    accumulator = initial || @array.first
    start_index = initial.nil? ? 1 : 0
    @array[start_index..].each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end

#Ищет минимальный элемент по критерию
def min_by
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

#Разбивает массив на группы, используя
  def group_by
  result = Hash.new { |hash, key| hash[key] = [] }
  @array.each do |element|
    key = yield(element)
    result[key] << element
  end
  result
end

#Находит первый элемент, соответствующий блоку
  def find
    @array.each do |element|
      return element if yield(element)
    end
    nil
  end
end