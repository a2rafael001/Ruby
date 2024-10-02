# student.rb

class Student
  # Генерация геттеров и сеттеров для всех атрибутов
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
