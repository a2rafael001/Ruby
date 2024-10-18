require_relative 'student'

students = [
  Student.new('Иванов', 'Иван', 'Иванович', 1, '+7 123 456 7890', '@ivanov', 'ivanov@example.com', 'https://github.com/ivanov'),
  Student.new('Петров', 'Петр', 'Петрович', 2, '+7 987 654 3210', '@petrov', 'petrov@example.com', 'https://github.com/petrov'),
  Student.new('Сидоров', 'Сидор', 'Сидорович') # Здесь мы не указываем ID и другие необязательные поля
]

puts "Информация о студентах:"
students.each do |student|
  puts student.to_s
end
