require_relative 'student'

# Создание объекта с корректным телефоном
student1 = Student.new(
  id: 1,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  phone: "+12345678901",
  email: "ivanov@mail.com"
)
puts student1.getInfo

# Создание объекта с некорректным телефоном
begin
  student2 = Student.new(
    id: 2,
    last_name: "Петров",
    first_name: "Петр",
    middle_name: "Петрович",
    phone: "12345"
  )
  puts student2.getInfo
rescue ArgumentError => e
  puts e.message
end

# Создание объекта без телефона (студент 3)
student3 = Student.new(
  id: 3,
  last_name: "Арутюнян",
  first_name: "Рафаэль",
  middle_name: "Гарегинович",
  github: "https://github.com/a2rafael001"
)
puts student3.getInfo

# Создание объекта с использованием строки
student4 = Student.from_string("2, Петров, Петр, Петрович, +98765432100, @petrov, petrov@mail.com, https://github.com/petrov")
puts student4.getInfo

# Создание объекта с минимальными данными
student5 = Student.from_string("3, Сидоров, Сергей, Сергеевич")
puts student5.getInfo

# Проверка отдельных значений
puts "ФИО: #{student1.get_full_name_initials}"
puts "GitHub: #{student1.get_github}"
puts "Основной контакт: #{student1.get_primary_contact}"

# Проверка метода класса Person для валидности телефона
puts Person.valid_phone?("+12345678901") # => true
puts Person.valid_phone?("12345")       # => false
