class Person

  attr_reader :id,  :git

  # Конструктор
  def initialize(id: nil,  git: nil)
    @git = git if git
    @id = id if id
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

  # Метод класса для проверки GitHub URL
  def self.valid_git?(git)
    return false unless git.is_a?(String)
    git.match?(/^https?:\/\/(www\.)?github\.com\/\w+$/)
  end

# Метод класса для проверки ФИО
  def self.name_valid?(name)
    return false unless name.is_a?(String)
    name.match?(/^[A-Za-zА-Яа-яЁё\s-]+$/)
end

# Метод для проверки существования контакта и гита
def validate?
  git_present? && contact_present?
end

# Методы для проверки наличия контактов и гита
def contact_present?
  !@phone.nil? || !@telegram.nil? || !@email.nil?
end

def git_present?
  !@git.nil? && !@git.empty?
end

end
