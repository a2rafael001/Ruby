#number_methods
#find_min_element
def find_min_element(array)
  min = array[0]
  for element in array
    min = element if element < min
  end
  min
end


def find_max_element(array)
  max = array[0]
  index = 1
  while index < array.length
    max = array[index] if array[index] > max
    index += 1
  end
  max
end

# Ввод массива с клавиатуры
puts "Введите числа, разделенные пробелами:"
input = gets.chomp
array = input.split.map(&:to_i)

# Вывод результатов
puts "Минимальный элемент: #{find_min_element(array)}"
puts "Максимальный элемент: #{find_max_element(array)}"
