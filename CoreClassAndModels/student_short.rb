class StudentShort < Person
  attr_reader :full_name_initials, :contact

  def initialize(full_name_initials, id: nil, git: nil, contact: nil)
    super(id: id, git: git)
    @full_name_initials = full_name_initials
    @contact = contact
  end

  # Конструктор 1: Создание из объекта Student
  def self.from_student(student)
    new(
      student.full_name_initials,
      id: student.id,
      git: student.git,
      contact: student.contact
    )
  end

  # Конструктор 2: Создание из строки
  def self.from_string(id, info_string)
    fields = info_string.split(', ').map(&:strip)
    raise ArgumentError, 'Недостаточно данных для создания объекта StudentShort' if fields.size < 3

    new(
      fields[0], # full_name_initials
      id: id,
      git: fields[1], # GitHub
      contact: fields[2..].join(', ') # Остальные поля как контактная информация
    )
  end

  def to_s
    "ID: #{id}, ФИО: #{full_name_initials}, Гит: #{git}, Контакт: #{contact}"
  end

  private_class_method :new
  private :id=, :git=
end
