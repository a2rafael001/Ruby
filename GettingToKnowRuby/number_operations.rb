# number_operations.rb

# Метод 1: Найтем количество чисел, взаимно простых с заданным
def count_coprimes(n)
  count = 0
  (1..n).each do |i|
    count += 1 if n.gcd(i) == 1
  end
  count
end

# Метод 2: Найти сумму цифр числа, делящихся на 3
def sum_of_digits_divisible_by_3(number)
  number.to_s.chars.map(&:to_i).select { |digit| digit % 3 == 0 }.sum
end

# Метод 3: Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа
def coprime_divisor_with_most_digits(number)
  digits = number.to_s.chars.map(&:to_i)
  max_coprimes_count = 0
  best_divisor = nil

  # Ищем все делители числа
  (1..number).each do |divisor|
    if number % divisor == 0
      # Считаем количество взаимно простых цифр
      coprimes_count = digits.count { |digit| divisor.gcd(digit) == 1 }
      
      # Обновляем наилучший делитель
      if coprimes_count > max_coprimes_count
        max_coprimes_count = coprimes_count
        best_divisor = divisor
      end
    end
  end

  best_divisor
end

# Примеры использования методов:
puts "Количество чисел, взаимно простых с 10: #{count_coprimes(10)}"
puts "Сумма цифр числа 12345, делящихся на 3: #{sum_of_digits_divisible_by_3(12345)}"
puts "Делитель числа 36, являющийся взаимно простым с наибольшим количеством цифр: #{coprime_divisor_with_most_digits(36)}"
