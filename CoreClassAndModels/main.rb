require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'student_tree'

# Создание объекта Person
puts "  Проверка класса Person\n  "

person = Person.new(id: 1, git: "https://github.com/example")
puts "GitHub: #{person.git}"
puts "ID: #{person.id}"
puts "GitHub   проверяю на валидацию: #{Person.valid_git?(person.git)}"
puts "Телефон  проверяю на валидацию: #{Student.valid_phone?('+12345678901')}"
puts "Email    проверяю на валидацию: #{Student.valid_email?('example@mail.com')}"
puts "Telegram проверяю на валидацию: #{Student.valid_telegram?('@example')}"

# Создание объекта Student
puts "\n  Проверка класса Student \n "
begin
  student = Student.new(
    id: 2,
    last_name: "Иванов",
    first_name: "Иван",
    middle_name: "Иванович",
    phone: "+12345678901",
    email: "ivanov@mail.com",
    telegram: "@ivanov",
    git: "https://github.com/ivanov"
  )
  puts student.to_s
  puts "ФИО с инициалами: #{student.full_name_initials}"
  puts "Контактная информация: #{student.contact}"
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end

# Проверка метода set_contacts
puts "\nПроверка метода set_contacts\n"
begin
  student.set_contacts(phone: "+98765432100", email: "newemail@mail.com")
  puts "Обновлённая контактная информация: #{student.contact}"
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end

# Создание объекта StudentShort из объекта Student
puts "\nПроверка класса StudentShort\n"
puts "\nПроверка метода from_student\n"
student_short = StudentShort.from_student(student)
puts student_short.to_s

# Создание объекта StudentShort из строки
puts "\nПроверка метода from_string"
begin
  student_short_from_string = StudentShort.from_string(
    3,
    "Петров П. П., https://github.com/petrov, petrov@mail.com, +98765432100"
  )
  puts student_short_from_string.to_s
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end

# Проверка валидности данных
puts "\nПроверка валидности данных"
puts "GitHub   проверяю на валидацию: #{Person.valid_git?('https://github.com/invalid-url')}"
puts "Телефон  проверяю на валидацию: #{Student.valid_phone?('12345')}"
puts "Email    проверяю на валидацию: #{Student.valid_email?('invalid_email')}"
puts "Telegram проверяю на валидацию: #{Student.valid_telegram?('invalid_telegram')}"

# Проверка метода validate?
puts "\nПроверка метода validate?\n"

puts "Данные валидны? #{student.validate?}"

puts "\nПроверка класса StudentTree\n"
student4 = Student.new(
  id: 4,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  birth_date: "15-05-2000",
  phone: "+12345678901",
  email: "ivanov@example.com",
  telegram: "@ivanov",
  git: "https://github.com/ivanov"
)

student5 = Student.new(
  id: 5,
  last_name: "Петров",
  first_name: "Пётр",
  middle_name: "Петрович",
  birth_date: "20-10-1999",
  phone: "+10987654321",
  email: "petrov@example.com",
  telegram: "@petrov",
  git: "https://github.com/petrov"
)

student6 = Student.new(
  id: 6,
  last_name: "Сидоров",
  first_name: "Сидор",
  middle_name: "Сидорович",
  birth_date: "10-01-2001",
  phone: "+11234567890",
  email: "sidorov@example.com",
  telegram: "@sidorov",
  git: "https://github.com/sidorov"
)

# Создаём дерево и вставляем студентов
tree = StudentTree.new
tree.insert(student4)
tree.insert(student5)
tree.insert(student6)

# Перебор студентов в отсортированном по дате рождения порядке:
puts "Студенты, отсортированные по дате рождения:"
tree.each do |student|
  puts student.to_s
end

# Итог
puts "\n=== Все методы успешно проверены ==="
