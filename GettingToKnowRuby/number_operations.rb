# Метод для нахождения делителя числа, являющегося взаимно простым с наибольшим количеством цифр
def divisor_with_max_coprime_digits(number)
  max_coprime_digits_count = 0
  best_divisor = nil

  (1..number).each do |divisor|
    next unless number % divisor == 0

    coprime_digits_count = number.to_s.chars.map(&:to_i).count do |digit|
      gcd(divisor, digit) == 1 && digit != 0
    end

    if coprime_digits_count > max_coprime_digits_count
      max_coprime_digits_count = coprime_digits_count
      best_divisor = divisor
    end
  end

  best_divisor
end

# Пример использования
number = 210
puts "Делитель числа #{number}, являющийся взаимно простым с наибольшим количеством цифр: #{divisor_with_max_coprime_digits(number)}"
