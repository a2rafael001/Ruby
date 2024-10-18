#number_methods

def find_min_element(array)
  min = array[0]
  for element in array
    min = element if element < min
  end
  min
end

# Ввод массива с клавиатуры
puts "Введите числа, разделенные пробелами:"
input = gets.chomp
array = input.split.map(&:to_i)

# Вывод результата
puts "Минимальный элемент: #{find_min_element(array)}"
