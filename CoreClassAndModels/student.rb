class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Конструктор: обязательные ФИО, остальные поля опциональны
  def initialize(id:, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, github: nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  # Метод для получения полного имени студента
  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end


  def puts_info
    puts "ID: #{@id}"
    puts "ФИО: #{@last_name} #{@first_name} #{@middle_name}"
    puts "Телефон: #{@phone || 'не указано'}"
    puts "Телеграм: #{@telegram || 'не указано'}"
    puts "Почта: #{@email || 'не указано'}"
    puts "Гит: #{@github || 'не указано'}"
    puts "-" * 20
  end
end
