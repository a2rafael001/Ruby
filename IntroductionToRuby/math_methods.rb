# Метод 1: Найтем количество чисел, взаимно простых с заданным

def count_coprimes(n)
  count = 0
  for i in 1..n
    if gcd_coprime(i, n)
      count += 1
    end
  end
  count
end

def gcd_coprime(a, b)
  while b != 0
    a, b = b, a % b
  end
  a == 1
end

# Метод 2: Найти сумму цифр числа, делящихся на 3
def sum(number)
  sum = 0
  while number > 0
    digit = number % 10  # Извлекаем последнюю цифру
    sum += digit if digit % 3 == 0  # Добавляем к сумме, если цифра делится на 3
    number /= 10  # Убираем последнюю цифру
  end
  sum
end

# Метод 3: Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа
def greatest_coprime(number)
  # Извлекаем цифры числа
  digits = []
  temp = number
  while temp > 0
    digits << temp % 10  # Извлекаем последнюю цифру
    temp /= 10           # Убираем последнюю цифру
  end

  # Находим все делители числа
  divisors = []
  i = 1
  while i <= number
    divisors << i if number % i == 0  # Добавляем делитель, если он подходит
    i += 1
  end

  # Ищем делитель с максимальным количеством взаимно простых цифр
  max_count = 0
  best_divisor = nil

  divisors.each do |divisor|
    count = 0
    digits.each do |digit|
      next if digit == 0  # Пропускаем цифру 0
      count += 1 if gcd(digit, divisor) == 1  # Проверяем взаимную простоту
    end

    if count > max_count
      max_count = count
      best_divisor = divisor
    end
  end

  best_divisor
end

# функция для нахождения НОД
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

methods = {
  1 => { name: "Найти количество чисел, взаимно простых с заданным", method: ->(n) { count_coprimes(n) } },
  2 => { name: "Найти сумму цифр числа, делящихся на 3", method: ->(n) { sum(n) } },
  3 => { name: "Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр", method: ->(n) { greatest_coprime(n) } }
}

loop do
  puts "Выберите метод:"
  methods.each { |key, value| puts "#{key}: #{value[:name]}" }
  puts "0: Выход"

  choice = gets.to_i
  break if choice == 0

  if methods.key?(choice)
    puts "Введите число:"
    number = gets.to_i
    result = methods[choice][:method].call(number)
    puts "Результат: #{result}"
  else
    puts "Неверный выбор, попробуйте снова."
  end

  puts "--------------------------------------"
end

