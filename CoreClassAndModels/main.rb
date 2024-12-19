require_relative 'student'

# Создаём объекты класса Student
student1 = Student.new(
  id: 1,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  phone: "+123456789",
  telegram: "@ivanov",
  email: "ivanov@mail.com",
  github: "github.com/ivanov"
)

student2 = Student.new(
  id: 2,
  last_name: "Петров",
  first_name: "Петр",
  middle_name: "Петрович",
  email: "petrov@mail.com"
)

student3 = Student.new(
  id: 3,
  last_name: "Арутюнян",
  first_name: "Рафаэль",
  middle_name: "Гарегинович"
)

# Выводим информацию о студентах
puts "Информация о студентах:"
student1.puts_info
student2.puts_info
student3.puts_info
