class ArrayProcessor
  attr_reader :arr

  def initialize(arr)
    @arr = arr.freeze
  end

  def all?
    @arr.each { |element| return false unless yield(element) }
    true
  end

  def flat_map
    result = []
    @arr.each { |element| result.concat(yield(element)) }
    result
  end

  def one?
    count = 0
    @arr.each do |element|
      count += 1 if yield(element)
      return false if count > 1
    end
    count == 1
  end

  # Если начальное значение не задано, используем первый элемент массива как аккумулятор,
  # а итерацию начинаем со второго элемента.
  def inject(initial = nil)
    if initial.nil?
      return nil if @arr.empty?
      result = @arr.first
      rest = @arr[1..-1] || []
    else
      result = initial
      rest = @arr
    end

    rest.each { |element| result = yield(result, element) }
    result
  end

  # Если массив пустой, возвращаем nil; иначе, перебираем начиная со второго элемента.
  def min_by
    return nil if @arr.empty?

    min_element = @arr.first
    min_value   = yield(min_element)

    @arr[1..-1].each do |element|
      value = yield(element)
      if value < min_value
        min_value   = value
        min_element = element
      end
    end
    min_element
  end

  def find
    @arr.each { |element| return element if yield(element) }
    nil
  end

  # Метод для подсчёта количества элементов массива, которые попадают в интервал [a..b].
  def count_elements_in_interval(a, b)
    @arr.count { |x| x >= a && x <= b }
  end

  # Метод для подсчёта количества элементов между первым и последним минимальным элементом.
  def count_elements_between_first_and_last_min
    return 0 if @arr.empty?

    min_val       = @arr.min
    first_min_idx = @arr.index(min_val)
    last_min_idx  = @arr.rindex(min_val)

    # Если минимальный элемент встречается только один раз
    return 0 if first_min_idx == last_min_idx

    last_min_idx - first_min_idx - 1
  end

  # Метод для построения списка элементов, уникальных для двух массивов.
  # В качестве второго массива передаётся аргумент other_array.
  def build_exclusive_list(other_array)
    freq_l1       = @arr.tally
    unique_in_l1  = freq_l1.select { |_, count| count == 1 }.keys

    freq_l2       = other_array.tally
    unique_in_l2  = freq_l2.select { |_, count| count == 1 }.keys

    (unique_in_l1 - unique_in_l2) + (unique_in_l2 - unique_in_l1)
  end
end
