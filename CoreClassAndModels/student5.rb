# student.rb

class Student
  attr_accessor :id, :surname, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор класса, принимающий хэш в качестве аргумента
  def initialize(surname:, first_name:, middle_name:, **options)
    @surname = surname
    @first_name = first_name
    @middle_name = middle_name

    # Инициализация остальных полей из options
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
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
student1 = Student.new(
  surname: 'Иванов',
  first_name: 'Иван',
  middle_name: 'Иванович',
  id: 1,
  phone: '+7 123 456 7890',
  telegram: '@ivanov',
  email: 'ivanov@example.com',
  git: 'https://github.com/ivanov'
)

student2 = Student.new(
  surname: 'Петров',
  first_name: 'Петр',
  middle_name: 'Петрович',
  id: 2,
  phone: '+7 987 654 3210',
  telegram: nil,
  email: 'petrov@example.com'
)

student3 = Student.new(
  surname: 'Сидоров',
  first_name: 'Сидор',
  middle_name: 'Сидорович'
)

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts student2
puts student3
