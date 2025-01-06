class Person
  attr_reader :phone, :email, :telegram, :github

  # Конструктор
  def initialize(phone: nil, email: nil, telegram: nil, github: nil)
    set_contacts(phone: phone, email: email, telegram: telegram)
    self.github = github
  end

  # Метод класса для проверки телефонного номера
  def self.valid_phone?(phone)
    !!(phone.is_a?(String) && phone.match(/^\+\d{10,15}$/))
  end

  # Метод класса для проверки email
  def self.valid_email?(email)
    !!(email.is_a?(String) && email.match(/^\S+@\S+\.\S+$/))
  end

  # Метод класса для проверки Telegram
  def self.valid_telegram?(telegram)
    !!(telegram.is_a?(String) && telegram.match(/^@\w+$/))
  end

  # Метод класса для проверки GitHub URL
  def self.valid_github?(github)
    !!(github.is_a?(String) && github.match(/^https?:\/\/(www\.)?github\.com\/\w+$/))
  end

  # Сеттер для GitHub с проверкой
  def github=(value)
    if value.nil? || Person.valid_github?(value)
      @github = value
    else
      raise ArgumentError, "Invalid GitHub URL: #{value}"
    end
  end

  # Метод для установки контактов
  def set_contacts(phone: nil, email: nil, telegram: nil)
    if phone && !Person.valid_phone?(phone)
      raise ArgumentError, "Invalid phone number: #{phone}"
    end

    if email && !Person.valid_email?(email)
      raise ArgumentError, "Invalid email: #{email}"
    end

    if telegram && !Person.valid_telegram?(telegram)
      raise ArgumentError, "Invalid Telegram username: #{telegram}"
    end

    @phone = phone
    @email = email
    @telegram = telegram
  end

  # Проверка наличия GitHub
  def validate_github
    raise ArgumentError, "Требуется GitHub" if github.nil? || github.strip.empty?
  end

  # Проверка наличия хотя бы одного контакта
  def validate_contacts
    if phone.nil? && email.nil? && telegram.nil?
      raise ArgumentError, "Требуется как минимум один контакт (телефон, email или Telegram)."
    end
  end

  # Общая валидация
  def validate
    validate_github
    validate_contacts
  end


  # Метод, возвращающий контакт в «человеческом» виде
  def primary_contact_info
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

  # Метод, возвращающий GitHub или "не указан"
  def github_or_placeholder
    github || 'не указан'
  end
end
