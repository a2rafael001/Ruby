# student.rb

class Student
  # Конструктор  геттеры/сеттеры  автоматически создаются для  полей
  attr_accessor :id, :surname, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор класса. Фамилия, имя и отчество обязательны, остальные поля не обязательны
  def initialize(surname, first_name, middle_name, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # Геттеры и сеттеры для каждого поля автоматически генерируются с помощью attr_accessor
end
