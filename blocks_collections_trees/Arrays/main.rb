require_relative 'task'

def main
  loop do
    puts 'Выберите задачу:'
    puts '1. Найти количество элементов в интервале a..b.'
    puts '2. Найти количество элементов между первым и последним минимальным.'
    puts '3. Найти количество элементов, значение которых принадлежит отрезку a..b.'
    puts '4. Построить новый список из уникальных элементов двух массивов.'
    puts '5. Закончить.'
    print 'Введите номер задачи: '
    choice = gets.to_i

    case choice
    when 1
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      print 'Введите границы интервала (a и b): '
      a, b = gets.split.map(&:to_i)
      result = count_elements_in_interval(arr, a, b)
      puts "Количество элементов в интервале [#{a}..#{b}]: #{result}"
    when 2
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      result = count_elements_between_first_and_last_min(arr)
      puts "Количество элементов между первым и последним минимальным: #{result}"
    when 3
      print 'Введите массив через пробел: '
      arr = gets.split.map(&:to_i)
      print 'Введите границы отрезка (a и b): '
      a, b = gets.split.map(&:to_i)
      result = count_elements_in_interval(arr, a, b)
      puts "Количество элементов в отрезке [#{a}..#{b}]: #{result}"
    when 4
      print 'Введите первый список (L1) через пробел: '
      l1 = gets.split.map(&:to_i)
      print 'Введите второй список (L2) через пробел: '
      l2 = gets.split.map(&:to_i)
      result = build_exclusive_list(l1, l2)
      puts "Новый список: #{result}"
    when 5
      puts 'Завершение программы. Спасибо!'
      break
    else
      puts 'Неверный выбор! Попробуйте снова.'
    end
    puts
  end
end

main
