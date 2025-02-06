require 'minitest/autorun'
require_relative 'array_processor'

class TestArrayProcessor < Minitest::Test
  def test_all
    processor = ArrayProcessor.new([2, 4, 6, -8])
    assert_equal true, processor.all? { |num| num.even? }

    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal true, processor.all? { |num| num > 0 }

    processor = ArrayProcessor.new([1, 2, -3, 4, -5])
    assert_equal false, processor.all? { |num| num > 0 }

    # Для пустого массива метод all? должен вернуть true (такое поведение аналогично Enumerable#all?)
    processor = ArrayProcessor.new([])
    assert_equal true, processor.all? { |num| num.even? }
  end

  def test_flat_map
    processor = ArrayProcessor.new([1..3, 4..8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], processor.flat_map { |range| range.to_a }

    processor = ArrayProcessor.new([1, 2, 3, 4])
    assert_equal [1, 2, 2, 4, 3, 6, 4, 8], processor.flat_map { |num| [num, num * 2] }

    processor = ArrayProcessor.new([])
    assert_equal [], processor.flat_map { |num| [num, num * 2] }
  end

  def test_one
    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal true, processor.one? { |num| num == 3 }
    assert_equal false, processor.one? { |num| num < 0 }

    processor = ArrayProcessor.new([-1, 2, -3, 8])
    assert_equal true, processor.one? { |num| num.even? && num == 2 }
    assert_equal false, processor.one? { |num| num == 6 }
  end

  def test_inject
    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    # Если начальное значение не передаётся, первый элемент используется как аккумулятор
    assert_equal 15, processor.inject { |sum, num| sum + num }

    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal 25, processor.inject(10) { |sum, num| sum + num }  # 10 + 1 + 2 + 3 + 4 + 5

    processor = ArrayProcessor.new(['When', 'will', 'it', 'end'])
    # Здесь для наглядности соединяем строки через пробел
    assert_equal 'When will it end', processor.inject { |concat, str| concat + " " + str }
  end

  def test_min_by
    processor = ArrayProcessor.new([5, 3, 8, 1, 4])
    assert_equal 1, processor.min_by { |num| num }

    processor = ArrayProcessor.new(['ruby', 'python', 'java', 'go'])
    assert_equal 'go', processor.min_by { |str| str.length }

    processor = ArrayProcessor.new([])
    assert_nil processor.min_by { |num| num }
  end

  def test_find
    processor = ArrayProcessor.new([
      { name: "Ivan",  age: 30 },
      { name: "Maga",  age: 20 },
      { name: "Khabib", age: 36 }
    ])
    assert_equal({ name: "Maga", age: 20 }, processor.find { |person| person[:name] == "Maga" })

    processor = ArrayProcessor.new([1, 3, 5, 6, 7])
    assert_equal 6, processor.find { |num| num.even? }

    processor = ArrayProcessor.new([])
    assert_nil processor.find { |num| num.even? }
  end

  def test_count_elements_in_interval
    processor = ArrayProcessor.new([1, 3, 5, 7, 9, 11])
    # Элементы, лежащие в интервале [4, 10] – это 5, 7 и 9
    assert_equal 3, processor.count_elements_in_interval(4, 10)

    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal 5, processor.count_elements_in_interval(1, 5)

    processor = ArrayProcessor.new([])
    assert_equal 0, processor.count_elements_in_interval(0, 100)
  end

  def test_count_elements_between_first_and_last_min
    processor = ArrayProcessor.new([4, 2, 3, 2, 5, 2])
    # Первый минимум (2) находится по индексу 1, последний – по индексу 5, между ними 3 элемента (индексы 2,3,4)
    assert_equal 3, processor.count_elements_between_first_and_last_min

    processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    # Минимальный элемент (1) встречается только один раз
    assert_equal 0, processor.count_elements_between_first_and_last_min

    processor = ArrayProcessor.new([])
    assert_equal 0, processor.count_elements_between_first_and_last_min
  end

  def test_build_exclusive_list
    processor = ArrayProcessor.new([1, 2, 3, 2, 4])
    other_array = [3, 5, 1, 6, 7]
    # Уникальные для первого массива – [4] (так как 1 и 3 встречаются в обоих, а 2 повторяется);
    # уникальные для второго – [5, 6, 7]
    # Ожидаемый результат – объединение: [4, 5, 6, 7]
    assert_equal [4, 5, 6, 7], processor.build_exclusive_list(other_array)

    processor = ArrayProcessor.new([1, 1, 2, 2])
    other_array = [1, 1, 2, 2]
    assert_equal [], processor.build_exclusive_list(other_array)

    processor = ArrayProcessor.new([1, 2, 3])
    other_array = []
    # Если второй массив пуст, то все элементы первого, встречающиеся по одному разу, остаются уникальными
    assert_equal [1, 2, 3], processor.build_exclusive_list(other_array)
  end
end
