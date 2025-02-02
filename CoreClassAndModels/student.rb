require_relative 'person'

class Student < Person
  # Указываем атрибуты напрямую
  attr_reader  :last_name, :first_name, :middle_name, :phone, :email, :telegram

  # Основной конструктор
  def initialize( id: ,last_name:, first_name:, middle_name:, phone: nil, email: nil, telegram: nil, git: nil)
    # Вызываем конструктор родительского класса для общих атрибутов
    super(id: id , git: git)
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name 
    set_contacts(phone: phone, email: email, telegram: telegram)
  end

 # Переопределение сеттеров
  def last_name=(value)
    if Student.name_valid?(value)
      @last_name = value
    else
      raise ArgumentError, "Фамилия введена неверно: #{value}"
    end
  end 

def first_name=(value)
    if Student.name_valid?(value)
      @first_name = value
    else
      raise ArgumentError, "Имя введено неверно: #{value}"
    end
  end

  def middle_name=(value)
    if Student.name_valid?(value)
      @middle_name = value
    else
      raise ArgumentError, "Отчество введено неверно: #{value}"
    end
  end 
  def git=(value)
    if Student.valid_git?(value)
      @git = value
    else
      raise ArgumentError, "GitHub введен неверно: #{value}"
    end
  end 

  # Метод для получения краткой информации о студенте
  def to_s

    "ID #{@id}, ФИО: #{full_name_initials}, Гит: #{@git || 'не указан'},  Контакт: #{contact},"
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
    info.push("Git: #{@git}") if git
    info.push ("Номер: #{@phone}") if phone
    info.push ("Telegram: #{@telegram}") if telegram
    info.push ("Email: #{@email}") if email
    info.join(" ; ")
  end

  # Метод для установки значений полей контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone &&!Person.valid_phone?(phone)
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

end

#абстрак contact ful_name