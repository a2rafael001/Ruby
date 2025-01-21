# 1. Метод для подсчёта количества элементов массива array, которые попадают в интервал [a..b].
def count_elements_in_interval(array, a, b)
  array.count { |x| x >= a && x <= b }
end

#Метод, решающий задачу:
#    "Дан целочисленный массив и интервал [a..b].
#     Найти количество элементов в этом интервале."
def solve_interval_task
  puts "Введите размер массива:"
  n = gets.to_i
if n <= 0
  puts "Размер массива должен быть положительным!"
  return
end

  puts "Введите #{n} целых чисел:"
  array = n.times.map { gets.to_i }

  puts "Введите границы интервала a и b:"
  a = gets.to_i
  b = gets.to_i

  # Подсчёт количества элементов в интервале [a..b]
  count_in_interval = count_elements_in_interval(array, a, b)

  puts "Количество элементов в интервале [#{a}..#{b}] = #{count_in_interval}"
end

# 2. Метод для подсчёта количества элементов между первым и последним минимальным элементом.
def count_elements_between_first_and_last_min(array)
  return 0 if array.empty?

  # Находим минимальное значение:
  min_val = array.min

  # Находим индекс первого вхождения минимального элемента:
  first_min_idx = array.index(min_val)

  # Находим индекс последнего вхождения минимального элемента:
  last_min_idx = array.rindex(min_val)

  # Если минимальный элемент встречается в массиве только один раз,то между первым и последним минимальным нет «промежутка».
  if first_min_idx == last_min_idx
    0
  else
    # Количество элементов строго между ними
    last_min_idx - first_min_idx - 1
  end
end


def solve_minima_task
  puts "Введите размер массива:"
 n = gets.to_i
if n <= 0
  puts "Размер массива должен быть положительным!"
  return
end


  puts "Введите #{n} целых чисел:"
  array = n.times.map { gets.to_i }

  result = count_elements_between_first_and_last_min(array)

  puts "Количество элементов между первым и последним минимальным: #{result}"
end

#3. Метод, решающий задачу:
# "Дан целочисленный массив и отрезок [a..b].
#  Найти количество элементов, значение которых принадлежит этому отрезку."
def solve_segment_task
  puts "Введите размер массива:"
  n = gets.to_i

  puts "Введите #{n} целых чисел:"
  array = n.times.map { gets.to_i }

  puts "Введите границы отрезка a и b:"
  a = gets.to_i
  b = gets.to_i

  # Подсчёт количества элементов в отрезке [a..b]
  count_in_segment = count_elements_in_interval(array, a, b)

  puts "Количество элементов, значение которых принадлежит отрезку [#{a}..#{b}] = #{count_in_segment}"
end

# метод с расширенным меню.
def main
  puts "Выберите задачу:"
  puts "1 - Найти количество элементов массива, попадающих в интервал [a..b]"
  puts "2 - Найти количество элементов между первым и последним минимальным"
  puts "3 - Найти количество элементов, значение которых принадлежит отрезку [a..b]"

  choice = gets.to_i
  case choice
  when 1
    solve_interval_task
  when 2
    solve_minima_task
  when 3
    solve_segment_task
  else
    puts "Некорректный выбор задачи!"
  end
end

# Запуск программы:
main
