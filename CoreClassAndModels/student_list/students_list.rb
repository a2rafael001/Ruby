require_relative '../model/student'
require_relative '../model/student_short'
require_relative '../library/data_list'
require_relative '../library/data_list_student_short'
require_relative '../student_list/students_list_json'
require_relative '../student_list/students_list_yaml'

class StudentsList
  attr_reader :students

  def initialize(filepath:, strategy:)
    @filepath = filepath
    @strategy = strategy
    self.students = []
  end

  def students=(students)
    unless students.nil? || students.is_a?(Array) 
      raise ArgumentError, "Неверный тип данных"
    end
    @students = students
  end

  def read
    self.students = @strategy.read(@filepath)
  end

  def write
    @strategy.write(@filepath, self.students)
  end

  def get_student_by_id(id)
    student = self.students.find { |student| student.id == id }
    raise IndexError, "Студент с ID #{id} не найден" if student.nil?
    student
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    if k <= 0 || n <= 0 || !k.is_a?(Integer) || !n.is_a?(Integer)
      raise ArgumentError, "Числа должны быть целыми и положительными"
    end
    start = (k - 1) * n
    selected = self.students[start, n] || []
    students_short = selected.map { |student| StudentShort.from_student(student) }
    data_list ||= DataListStudentShort.new(students_short)
    data_list.set_offset(start)
    data_list
  end

  def set_offset(offset)
    @offset = offset
  end

  def sort_by_surname_initials
    self.students.sort_by! { |student| student.full_name_initials }
  end

  def add_student(student)
    if self.students.any? { |existing_student| existing_student == student }
      raise ArgumentError, "Такой студент уже существует в списке"
    end

    new_id = self.students.empty? ? 1 : self.students.map(&:id).max + 1
    student_with_new_id = Student.new(
      last_name: student.second_name,
      first_name: student.first_name,
      middle_name: student.patronymic,
      id: new_id,
      git: student.git,
      birth_date: student.birth_date,
      phone: student.phone_number,
      email: student.email,
      telegram: student.telegram
    )
    self.students << student_with_new_id
  end

  def replace_student_by_id(id, new_student)
    index = self.students.find_index { |student| student.id == id }
    raise IndexError, 'Студента с таким id нет' unless index

    if self.students.any? { |existing_student| existing_student == new_student && existing_student.id != id }
      raise ArgumentError, "Замена невозможна: студент с такими же данными уже существует"
    end

    new_student.id = id
    self.students[index] = new_student
  end

  def remove_student_by_id(id)
    self.students.reject! { |student| student.id == id }
  end

  def get_student_short_count
    self.students.count
  end
end