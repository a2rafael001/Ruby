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


