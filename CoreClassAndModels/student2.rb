# student.rb

class Student
  attr_accessor :id, :surname, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор класса
  def initialize(surname, first_name, middle_name, **options)
    @surname = surname
    @first_name = first_name
    @middle_name = middle_name

    # Инициализация остальных полей с помощью options
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  # Метод для отображения информации о студенте
  def to_s
    "ID: #{id || 'N/A'}, ФИО: #{surname} #{first_name} #{middle_name}, " \
    "Телефон: #{phone || 'N/A'}, Телеграм: #{telegram || 'N/A'}, " \
    "Почта: #{email || 'N/A'}, Git: #{git || 'N/A'}"
  end
end
# main.rb
require './student'

# Создаем несколько объектов класса Student
student1 = Student.new('Иванов', 'Иван', 'Иванович', id: 1, phone: '+7 123 456 7890', telegram: '@ivanov', email: 'ivanov@example.com', git: 'https://github.com/ivanov')
student2 = Student.new('Петров', 'Петр', 'Петрович', id: 2, phone: '+7 987 654 3210', telegram: '@petrov', email: 'petrov@example.com', git: 'https://github.com/petrov')
student3 = Student.new('Сидоров', 'Сидор', 'Сидорович')

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts student2
puts student3
