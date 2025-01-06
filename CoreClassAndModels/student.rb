require_relative 'person'

class Student < Person
  ATTRIBUTES = [:id, :last_name, :first_name, :middle_name,
                :phone, :telegram, :email, :github]
  attr_accessor(*ATTRIBUTES)

  # Основной конструктор
  def initialize(**argument)
  
    super(
      phone:    argument[:phone],
      email:    argument[:email],
      telegram: argument[:telegram],
      github:   argument[:github]
    )
    @id          = argument[:id]
    @last_name   = argument[:last_name]
    @first_name  = argument[:first_name]
    @middle_name = argument[:middle_name]
  end

  # Конструктор, принимающий строку
  def self.from_string(data)
    fields = data.split(", ").map(&:strip)
    raise ArgumentError, "Insufficient data to create Student" if fields.size < 3

    argument = {
      id:          fields[0].to_i,
      last_name:   fields[1],
      first_name:  fields[2],
      middle_name: fields[3],
      phone:       fields[4],
      telegram:    fields[5],
      email:       fields[6],
      github:      fields[7]
    }.compact

    new(**argument)
  end

  # Метод для получения краткой информации о студенте
  def getInfo
    "#{full_name_initials}, Гит: #{github_or_placeholder}, Связь: #{primary_contact_info}"
  end

  # Методы для получения отдельных значений без возможности изменения
  def get_full_name_initials
    full_name_initials
  end

  def get_github
    github_or_placeholder
  end

  def get_primary_contact
    primary_contact_info
  end

  # Вспомогательный метод для получения ФИО с инициалами
  def full_name_initials
    # Проверка на случай, если вдруг имя или отчество = nil
    fn = first_name ? first_name[0] + "." : ""
    mn = middle_name ? middle_name[0] + "." : ""
    "#{last_name} #{fn} #{mn}".strip
  end
end
