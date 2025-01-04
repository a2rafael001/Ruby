class Person
  attr_accessor :phone

  # Конструктор
  def initialize(phone: nil)
    self.phone = phone
  end

  # Метод класса для проверки телефонного номера
  def self.valid_phone?(phone)
    !!(phone.is_a?(String) && phone.match(/^\+\d{10,15}$/))
  end

  # Сеттер с проверкой телефонного номера
  def phone=(value)
    if value.nil? || Person.valid_phone?(value)
      @phone = value
    else
      raise ArgumentError, "Invalid phone number: #{value}"
    end
  end
end
