class Person
  attr_accessor :phone, :email, :telegram, :github

  # Конструктор
  def initialize(phone: nil, email: nil, telegram: nil, github: nil)
    self.phone = phone
    self.email = email
    self.telegram = telegram
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

  # Сеттер для телефона с проверкой
  def phone=(value)
    if value.nil? || Person.valid_phone?(value)
      @phone = value
    else
      raise ArgumentError, "Invalid phone number: #{value}"
    end
  end

  # Сеттер для email с проверкой
  def email=(value)
    if value.nil? || Person.valid_email?(value)
      @email = value
    else
      raise ArgumentError, "Invalid email: #{value}"
    end
  end

  # Сеттер для Telegram с проверкой
  def telegram=(value)
    if value.nil? || Person.valid_telegram?(value)
      @telegram = value
    else
      raise ArgumentError, "Invalid Telegram username: #{value}"
    end
  end

  # Сеттер для GitHub с проверкой
  def github=(value)
    if value.nil? || Person.valid_github?(value)
      @github = value
    else
      raise ArgumentError, "Invalid GitHub URL: #{value}"
    end
  end
end
