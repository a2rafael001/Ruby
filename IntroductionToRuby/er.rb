#нод
	def find_gcd(a,b)
		while b!=0
			a,b=b,a%b
		end
		a
	end
	

	def find_min(array)
  min = array[0]
  array.each { |el| min = el if el < min }
  min
end

def find_max(array)
  max = array[0]
  array.each { |el| max = el if el > max }
  max
end

#сортировка по возростанию
def insertion_sort(array)
  (1...array.size).each do |i|
    key = array[i]
    j = i - 1
    while j >= 0 && array[j] > key
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = key
  end
  array
end


