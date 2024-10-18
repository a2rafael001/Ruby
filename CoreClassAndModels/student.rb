class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор класса
  def initialize(surname, name, patronymic, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # Геттеры
  def get_id
    @id
  end

  def get_surname
    @surname
  end

  def get_name
    @name
  end

  def get_patronymic
    @patronymic
  end

  def get_phone
    @phone
  end

  def get_telegram
    @telegram
  end

  def get_email
    @email
  end

  def get_git
    @git
  end

  # Сеттеры
  def set_id(id)
    @id = id
  end

  def set_surname(surname)
    @surname = surname
  end

  def set_name(name)
    @name = name
  end

  def set_patronymic(patronymic)
    @patronymic = patronymic
  end

  def set_phone(phone)
    @phone = phone
  end

  def set_telegram(telegram)
    @telegram = telegram
  end

  def set_email(email)
    @email = email
  end

  def set_git(git)
    @git = git
  end

  # Метод для вывода информации о студенте
  def to_s
    "ID: #{@id || 'N/A'}, ФИО: #{@surname} #{@name} #{@patronymic}, Телефон: #{@phone || 'N/A'}, Телеграм: #{@telegram || 'N/A'}, Почта: #{@email || 'N/A'}, Git: #{@git || 'N/A'}"
  end
end
