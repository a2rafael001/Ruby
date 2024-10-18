# number_operations.rb

# Метод 1: Найти минимальный элемент массива
def find_min_element(array)
  return nil if array.empty?
  min_element = array[0]
  array.each { |element| min_element = element if element < min_element }
  min_element
end

# Метод 2: Найти все положительные элементы массива
def find_positive_elements(array)
  positive_elements = array.select { |element| element > 0 }
  positive_elements
end

# Метод 3: Найти индекс первого положительного элемента массива
def find_first_positive_index(array)
  array.each_with_index do |element, index|
    return index if element > 0
  end
  nil# Возвращаем nil, если положительный элемент не найден
end

# Метод для чтения массива из файла
def read_array_from_file(file_path)
  begin
    # Читаем файл, убираем пробелы и перевод строки, превращаем в массив чисел
    File.read(file_path).split.map(&:to_i)
  rescue Errno::ENOENT
    puts "Ошибка: файл не найден."
    exit
  rescue => e
    puts "Ошибка: #{e.message}"
    exit
  end
end

# Основная логика программы
if ARGV.length < 2
  puts "Использование: ruby number_operations.rb <номер_метода> <путь_к_файлу>"
  puts "Пример: ruby number_operations.rb 1 numbers.txt"
  exit
end

method_number = ARGV[0].to_i
file_path = ARGV[1]

# Чтение массива из файла
array = read_array_from_file(file_path)

# Выполнение выбранного метода
case method_number
when 1
  puts "Минимальный элемент массива: #{find_min_element(array)}"
when 2
  puts "Положительные элементы массива: #{find_positive_elements(array)}"
when 3
  puts "Индекс первого положительного элемента: #{find_first_positive_index(array)}"
else
  puts "Ошибка: неверный номер метода. Выберите 1, 2 или 3."
end
