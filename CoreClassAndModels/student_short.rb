class StudentShort
  attr_reader :id, :full_name_initials, :github, :contact

  # Конструктор 1: принимает объект класса Student
  def initialize(student)
    @id = student.id
    @full_name_initials = student.full_name_initials
    @github = student.github || 'не указан'
    @contact = determine_contact(student)
  end

  # Конструктор 2: принимает ID и строку с остальной информацией
  def self.from_string(id, data)
    fields = data.split(", ").map(&:strip)
    raise ArgumentError, "Insufficient data to create StudentShort" if fields.size < 2

    full_name_initials = fields[0]
    github = fields[1]
    contact = fields[2] || 'не указан'

    new_instance = allocate
    new_instance.send(:initialize_from_data, id, full_name_initials, github, contact)
    new_instance
  end

  def to_s
    "ID: #{id}, ФИО: #{full_name_initials}, Гит: #{github}, Связь: #{contact}"
  end

  private

  def initialize_from_data(id, full_name_initials, github, contact)
    @id = id
    @full_name_initials = full_name_initials
    @github = github
    @contact = contact
  end

  def determine_contact(student)
    if student.phone
      "Телефон: #{student.phone}"
    elsif student.email
      "Почта: #{student.email}"
    elsif student.telegram
      "Телеграм: #{student.telegram}"
    else
      "Контакт не указан"
    end
  end
end
