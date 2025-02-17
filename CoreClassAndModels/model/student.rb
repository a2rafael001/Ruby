require 'date'
require_relative 'person'

class Student < Person
  include Comparable
  # Указываем атрибуты напрямую
  attr_reader  :last_name, :first_name, :middle_name, :phone, :email, :telegram, :birth_date

  # Основной конструктор
  def initialize( id: ,last_name:, first_name:, middle_name:,birth_date: nil, phone: nil, email: nil, telegram: nil, git: nil)
    # Вызываем конструктор родительского класса для общих атрибутов
    super(id: id , git: git)
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name 
    self.birth_date  = birth_date if birth_date
    set_contacts(phone: phone, email: email, telegram: telegram)
  end

# Метод класса для проверки ФИО
  def self.name_valid?(name)
    return false unless name.is_a?(String)
    name.match?(/^[A-Za-zА-Яа-яЁё\s-]+$/)
end

  # Метод класса для проверки телефонного номера
  def self.valid_phone?(phone)
   return false unless phone.is_a?(String)
   phone.match?(/^\+?\d{10,15}$/)
  end

  # Метод класса для проверки email
  def self.valid_email?(email)
   return false unless email.is_a?(String)
   email.match?(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
end

  # Метод класса для проверки Telegram
  def self.valid_telegram?(telegram)
   return false unless telegram.is_a?(String)
   telegram.match?(/^@\w+$/)
  end

   def self.valid_birth?(date)
    begin
      Date.strptime(date, '%Y-%m-%d') 
      true
    rescue ArgumentError
      false
    end
  end

 # Переопределение сеттеров
  def last_name=(ln)
    if Student.name_valid?(ln)
      @last_name = ln
    else
      raise ArgumentError, "Фамилия введена неверно: #{ln}"
    end
  end 

def first_name=(fn)
    if Student.name_valid?(fn)
      @first_name = fn
    else
      raise ArgumentError, "Имя введено неверно: #{fn}"
    end
  end

  def middle_name=(mn)
    if Student.name_valid?(mn)
      @middle_name = mn
    else
      raise ArgumentError, "Отчество введено неверно: #{mn}"
    end
  end 

   def phone=(phone)
    if Student.valid_phone?(phone)
      @phone = phone
    else
      raise ArgumentError, "phone введено неверно: #{phone}"
    end
  end

  def email=(email)
    if Student.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "email введено неверно: #{email}"
    end
  end

  def telegram=(telegram)
    if Student.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "telegram введено неверно: #{telegram}"
    end
  end

   def birth_date=(birth_date)
    if Student.valid_birth?(birth_date)
      @birth_date = Date.strptime(birth_date, '%Y-%m-%d') # Преобразуем строку в объект Date
    else
      raise ArgumentError, "Дата рождения введена неверно: #{birth_date}"
    end
  end

  # Метод для получения краткой информации о студенте
  def to_s

    "ID #{@id}, ФИО: #{full_name_initials}, Дата рождения: #{@birth_date}, Гит: #{@git || 'не указан'},  Контакт: #{contact},"
  end

   def <=>(other)
    return nil unless other.is_a?(Student)
    birth_date <=> other.birth_date
  end
 

  def contact
    contact_info = []
    contact_info << "Телефон: #{phone}" if phone
    contact_info << "Telegram: #{telegram}" if telegram
    contact_info << "Email: #{email}" if email
    contact_info.join(' ; ')
  end

  # Метод для получения ФИО с инициалами
  def full_name_initials
    # Проверка на случай, если вдруг имя или отчество = nil
    fn = @first_name ? first_name[0] + "." : ""
    mn = @middle_name ? middle_name[0] + "." : ""
    "#{last_name} #{fn} #{mn}".strip
  end


 def get_info
    info=[]
    info.push("ФИО: #{full_name_initials}.")
    info.push("Дата рождения: #{@birth_date}")
    info.push("Git: #{@git}") if git
    info.push ("Номер: #{@phone}") if phone
    info.push ("Telegram: #{@telegram}") if telegram
    info.push ("Email: #{@email}") if email
    info.join(" ; ")
  end

  # Метод для установки значений полей контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone &&!Student.valid_phone?(phone)
      raise ArgumentError, "Номер введен неверно: #{phone}"
    else
      @phone = phone
    end
    if telegram &&!Student.valid_telegram?(telegram)
      raise ArgumentError, "Телеграм введен неверно: #{telegram}"
    else
      @telegram = telegram
    end
    if email && !Student.valid_email?(email)
      raise ArgumentError, "Email введен неверно: #{email}"
    else
      @email = email
    end
  end

  # Методы для проверки наличия контактов и гита
def contact_present?
  !@phone.nil? || !@telegram.nil? || !@email.nil?
end

end
