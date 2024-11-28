# Метод 1: Найтем количество чисел, взаимно простых с заданным
def gcd_coprime(a, b)
  while b != 0
    a, b = b, a % b
  end
  a == 1
end
def count_coprimes(n)
  count = 0
  for i in 1..n
    if are_coprime(i, n)
      count += 1
    end
  end
  count
end

# Метод 2: Найти сумму цифр числа, делящихся на 3
def count_odd_digits_greater_than_3(number)
  count = 0
  while number > 0
    digit = number % 10  # Извлекаем последнюю цифру
    if digit % 2 != 0 && digit > 3  # Проверяем на нечётность (остаток от деления 2) и больше ли цифра 3
      count += 1
    end
    number /= 10  # Убираем последнюю цифру
  end
  count
end
