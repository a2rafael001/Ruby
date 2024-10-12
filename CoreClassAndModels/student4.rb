# student.rb

class Student
  attr_accessor :id, :surname, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор класса
  def initialize(surname, first_name, middle_name, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @surname = surname
    @first_name = first_name
    @middle_name = middle_name
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # Метод для отображения информации о студенте
  def to_s
    <<~INFO
      ID: #{id || 'N/A'},
      ФИО: #{surname} #{first_name} #{middle_name},
      Телефон: #{phone || 'N/A'},
      Телеграм: #{telegram || 'N/A'},
      Почта: #{email || 'N/A'},
      Git: #{git || 'N/A'}
    INFO
  end
end
# main.rb
require './student'

# Создаем несколько объектов класса Student с различными комбинациями полей
student1 = Student.new('Иванов', 'Иван', 'Иванович', 1, '+7 123 456 7890', '@ivanov', 'ivanov@example.com', 'https://github.com/ivanov')
student2 = Student.new('Петров', 'Петр', 'Петрович', 2, '+7 987 654 3210', nil, 'petrov@example.com')
student3 = Student.new('Сидоров', 'Сидор', 'Сидорович')

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts student2
puts student3
