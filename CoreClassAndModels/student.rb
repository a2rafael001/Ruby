require_relative 'person'

class Student < Person
  ATRIBUTI = [:id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github]
  attr_accessor(*ATRIBUTI)

  # Основной конструктор
  def initialize(**argument)
    super(phone: argument[:phone])
    ATRIBUTI.each do |attr|
      self.send("#{attr}=", argument[attr])
    end
  end

  # Конструктор, принимающий строку
  def self.from_string(data)
    fields = data.split(", ").map(&:strip)
    raise ArgumentError, "Insufficient data to create Student" if fields.size < 3

    argument = {
      id: fields[0].to_i,
      last_name: fields[1],
      first_name: fields[2],
      middle_name: fields[3],
      phone: fields[4],
      telegram: fields[5],
      email: fields[6],
      github: fields[7]
    }.compact

    new(**argument)
  end

  # Метод для получения краткой информации о студенте
  def getInfo
    "#{full_name_initials}, Гит: #{github || 'не указан'}, Связь: #{primary_contact}"
  end

  # Методы для получения отдельных значений без возможности изменения
  def get_full_name_initials
    full_name_initials
  end

  def get_github
    github || 'не указан'
  end

  def get_primary_contact
    primary_contact
  end

  # Вспомогательный метод для получения ФИО с инициалами
  def full_name_initials
    "#{last_name} #{first_name[0]}. #{middle_name[0]}."
  end

  # Вспомогательный метод для получения основного контакта
  def primary_contact
    if phone
      "Телефон: #{phone}"
    elsif email
      "Почта: #{email}"
    elsif telegram
      "Телеграм: #{telegram}"
    else
      "Контакт не указан"
    end
  end
end
