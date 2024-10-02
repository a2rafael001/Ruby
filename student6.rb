# student.rb

class Student
  attr_accessor :id, :surname, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор класса, принимающий хэш в качестве аргумента
  def initialize(surname:, first_name:, middle_name:, **options)
    @surname = surname
    @first_name = first_name
    @middle_name = middle_name

    # Проверяем и устанавливаем номер телефона
    self.phone = options[:phone] if options[:phone]
    
    # Инициализация остальных полей из options
    options.each do |key, value|
      instance_variable_set("@#{key}", value) unless key == :phone
    end
  end

  # Метод для установки номера телефона с проверкой
  def phone=(number)
    raise ArgumentError, 'Неверный формат номера телефона' unless self.class.valid_phone?(number)
    
    @phone = number
  end

  # Метод класса для проверки, является ли строка телефонным номером
  def self.valid_phone?(number)
    # Пример регулярного выражения для проверки формата телефонного номера
    # Здесь допустимы номера в формате +7 (123) 456-78-90 или +71234567890
    !!(number =~ /^\+?\d{1,3}[\s-]?\(?\d{1,4}?\)?[\s-]?\d{1,4}[\s-]?\d{1,4}[\s-]?\d{1,9}$/)
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

begin

  
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
    phone: '+7 987 654 3210'
  )

  student3 = Student.new(
    surname: 'Сидоров',
    first_name: 'Сидор',
    middle_name: 'Сидорович'
  )

  # Пробуем создать студента с неверным номером телефона
  student_invalid = Student.new(
    surname: 'Неправильный',
    first_name: 'Студент',
    middle_name: 'Ошибка',
    phone: '123456'
  )

rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts student2
puts student3
