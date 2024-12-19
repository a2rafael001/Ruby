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

  # Переопределение метода to_s для удобного вывода информации
  def to_s
    "ID: #{id}\nФИО: #{full_name}\nТелефон: #{phone || 'не указано'}\n" \
    "Телеграм: #{telegram || 'не указано'}\nПочта: #{email || 'не указано'}\nГит: #{github || 'не указано'}"
  end
end
