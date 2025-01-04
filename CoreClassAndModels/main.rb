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
student1.puts_info

# Создание объекта с некорректным телефоном
begin
  student2 = Student.new(
    id: 2,
    last_name: "Петров",
    first_name: "Петр",
    middle_name: "Петрович",
    phone: "12345"
  )
  student2.puts_info
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
student3.puts_info

# Попытка изменить телефон на некорректный
begin
  student1.set_contacts(phone: "valid_phone")
   student3.set_contacts(email: "invalid_email")
rescue ArgumentError => e
  puts e.message
end

# Проверка номера через метод класса Person
puts  Person.valid_phone?("+12345678901") # => true
puts  Person.valid_phone?("12345")       # => false
