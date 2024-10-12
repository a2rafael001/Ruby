# Метод для нахождения суммы цифр числа, делящихся на 3
def sum_of_digits_divisible_by_3(number)
  sum = 0
  number.to_s.chars.map(&:to_i).each do |digit|
    sum += digit if digit % 3 == 0
  end
  sum
end

# Пример использования
number = 12345
puts "Сумма цифр числа #{number}, делящихся на 3: #{sum_of_digits_divisible_by_3(number)}"
