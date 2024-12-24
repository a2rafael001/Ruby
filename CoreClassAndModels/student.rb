class Student
  ATRIBUTI = [:id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github]
  attr_accessor(*ATRIBUTI)

  # Конструктор
  def initialize(**argument)
    ATRIBUTI.each do |attr|
      self.send("#{attr}=", argument[attr])
    end
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  def puts_info
    puts <<~INFO
      ID: #{id || 'не указано'}
      ФИО: #{full_name}
      Телефон: #{phone || 'не указано'}
      Телеграм: #{telegram || 'не указано'}
      Почта: #{email || 'не указано'}
      Гит: #{github || 'не указано'}
      #{'-' * 20}
    INFO
  end
end
