# number_methods.rb

# Метод 1: Найти минимальный элемент массива с использованием цикла for
def find_min_element_for(array)
  return nil if array.empty?
  
  min_element = array[0]
  
  for element in array
    min_element = element if element < min_element
  end
  
  min_element
end

# Метод 1: Найти минимальный элемент массива с использованием цикла while
def find_min_element_while(array)
  return nil if array.empty?
  
  min_element = array[0]
  index = 1
  
  while index < array.length
    min_element = array[index] if array[index] < min_element
    index += 1
  end
  
  min_element
end

# Метод 2: Найти все положительные элементы массива с использованием цикла for
def find_positive_elements_for(array)
  positive_elements = []
  
  for element in array
    positive_elements << element if element > 0
  end
  
  positive_elements
end

# Метод 2: Найти все положительные элементы массива с использованием цикла while
def find_positive_elements_while(array)
  positive_elements = []
  index = 0
  
  while index < array.length
    positive_elements << array[index] if array[index] > 0
    index += 1
  end
  
  positive_elements
end

# Метод 3: Найти индекс первого положительного элемента массива с использованием цикла for
def find_first_positive_index_for(array)
  for index in 0...array.length
    return index if array[index] > 0
  end
  
  nil
end

# Метод 3: Найти индекс первого положительного элемента массива с использованием цикла while
def find_first_positive_index_while(array)
  index = 0
  
  while index < array.length
    return index if array[index] > 0
    index += 1
  end
  
  nil
end

# Примеры использования методов:
array = [-5, -2, 0, 3, 7, -8]

puts "Минимальный элемент массива (for): #{find_min_element_for(array)}"
puts "Минимальный элемент массива (while): #{find_min_element_while(array)}"

puts "Положительные элементы массива (for): #{find_positive_elements_for(array)}"
puts "Положительные элементы массива (while): #{find_positive_elements_while(array)}"

puts "Индекс первого положительного элемента массива (for): #{find_first_positive_index_for(array)}"
puts "Индекс первого положительного элемента массива (while): #{find_first_positive_index_while(array)}"
