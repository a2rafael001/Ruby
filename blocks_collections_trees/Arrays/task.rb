# Метод для подсчёта количества элементов массива array, которые попадают в интервал [a..b].
def count_elements_in_interval(array, a, b)
  array.count { |x| x >= a && x <= b }
end

# Метод для подсчёта количества элементов между первым и последним минимальным элементом.
def count_elements_between_first_and_last_min(array)
  return 0 if array.empty?

  min_val = array.min
  first_min_idx = array.index(min_val)
  last_min_idx = array.rindex(min_val)

  # Если минимальный элемент встречается только один раз
  return 0 if first_min_idx == last_min_idx

  # Количество элементов между ними
  last_min_idx - first_min_idx - 1
end

# Метод для построения списка элементов, уникальных для двух массивов.
def build_exclusive_list(l1, l2)
  freq_l1 = l1.tally
  unique_in_l1 = freq_l1.select { |_elem, count| count == 1 }.keys

  freq_l2 = l2.tally
  unique_in_l2 = freq_l2.select { |_elem, count| count == 1 }.keys

  (unique_in_l1 - unique_in_l2) + (unique_in_l2 - unique_in_l1)
end
