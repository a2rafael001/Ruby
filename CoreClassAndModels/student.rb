require_relative 'person'

class Student < Person
  ATRIBUTI = [:id, :last_name, :first_name, :middle_name, :telegram, :email, :github]
  attr_accessor(*ATRIBUTI)

  # Конструктор
  def initialize(**argument)
    super(phone: argument[:phone])
    ATRIBUTI.each do |attr|
      self.send("#{attr}=", argument[attr])
    end
  end

  # Конструктор, принимающий строку
  def self.from_string(string)
    data = string.split(',').map(&:strip) # Разделяем строку по запятым и убираем пробелы
    raise ArgumentError, "Invalid input string" if data.size < 4 # Минимум 4 обязательных параметра (ID и ФИО)

    self.new(
      id: data[0].to_i,
      last_name: data[1],
      first_name: data[2],
      middle_name: data[3],
      phone: data[4],
      telegram: data[5],
      email: data[6],
      github: data[7]
    )
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
