require_relative 'person'

class Student < Person
  ATRIBUTI = [:id, :last_name, :first_name, :middle_name, :telegram, :email, :github]
  attr_accessor(*ATRIBUTI)

  # Конструктор
  def initialize(**argument)
    super(phone: argument[:phone]) # Передаем телефон в родительский конструктор
    ATRIBUTI.each do |attr|
      self.send("#{attr}=", argument[attr])
    end
  end

  def full_name
    "#{last_name} #{first_name[0]}. #{middle_name[0]}."
  end

  def puts_info
    puts <<~INFO
      ID: #{id || 'не указано'}
      ФИО: #{full_name}
      Телефон: #{phone || 'не указано'}
      Телеграм: #{telegram || 'не указано'}
      Почта: #{email || 'не указано'}
      Гит: #{github || 'не указано'}
      #{'-' * 20}
    INFO
  end
end
