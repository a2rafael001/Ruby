# Метод для подсчёта количества элементов массива array,которые попадают в интервал [a..b].
def count_elements_in_interval(array, a, b)
  array.count { |x| x >= a && x <= b }
end

# Метод, решающий задачу:
# "Дан целочисленный массив и интервал [a..b].
#  Найти количество элементов в этом интервале."
  def solve_interval_task
    puts "Введите размер массива:"
    n = gets.to_i

  puts "Введите #{n} целых чисел:"
  # n.times.map { ... } не содержит явного цикла в виде for/while,
  # но под капотом создаётся блок, итерирующийся n раз — это допустимо по условию.
  array = n.times.map { gets.to_i }

  puts "Введите границы интервала a и b:"
  a = gets.to_i
  b = gets.to_i

  # Подсчёт количества элементов в интервале [a..b]
  count_in_interval = count_elements_in_interval(array, a, b)

  puts "Количество элементов в интервале [#{a}..#{b}] = #{count_in_interval}"
end


# Если задач больше, можно добавить дополнительные пункты меню.
def main
  puts "Выберите задачу:"
  puts "1 - Найти количество элементов массива, попадающих в интервал [a..b]"
  choice = gets.to_i

  case choice
  when 1
    solve_interval_task
  else
    puts "Некорректный выбор задачи!"
  end
end

# Запуск программы:
main
