require_relative 'person'
require_relative 'student'

class StudentShort
  attr_reader :id, :full_name_initials, :github, :email_info, :contact

  # Конструктор 1: принимает объект класса Student
  def initialize(student)
    @id                  = student.id
    @full_name_initials  = student.full_name_initials
    # Вместо github || 'не указан' используем метод из Person
    @github              = student.github_or_placeholder
    @email_info = student.email ? student.email : 'не указана'


    # Вместо ручной логики — используем метод из Person
    @contact             = student.primary_contact_info
  end

  # Конструктор 2: принимает ID и строку с остальной информацией
  def self.from_string(id, data)
    fields = data.split(", ").map(&:strip)
    raise ArgumentError, "Недостаточно данных для создания объекта Student" if fields.size < 2

    full_name_initials = fields[0]
    github             = fields[1] || 'не указан'
    email_info         = fields[2] || 'не указана'  
    contact            = fields[3] || 'не указан'  

    new_instance = allocate
    new_instance.send(:initialize_from_data, id, full_name_initials, github, email_info, contact)
    new_instance
  end

  def to_s
        "ID: #{id}, ФИО: #{full_name_initials}, Гит: #{github}, Почта: #{email_info}, Контакт: #{contact}"
  end

  private

  def initialize_from_data(id, full_name_initials, github, email_info, contact)
    @id                  = id
    @full_name_initials  = full_name_initials
    @email_info          =email_info
    @github              = github
    @contact             = contact
  end
end
