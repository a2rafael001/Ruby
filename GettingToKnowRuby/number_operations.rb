# Метод для нахождения количества чисел, взаимно простых с заданным
def count_coprime_numbers(number)
  count = 0
  (1...number).each do |i|
    count += 1 if gcd(number, i) == 1
  end
  count
end

# Метод для нахождения НОД (алгоритм Евклида)
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

# Пример использования
number = 12
puts "Количество чисел, взаимно простых с #{number}: #{count_coprime_numbers(number)}"
