class Person

  attr_reader :id,  :git

  # Конструктор
  def initialize(id: nil,  git: nil)
    self.git  = git 
    self.id   = id 
  end

  # Метод класса для проверки GitHub URL
  def self.valid_git?(git)
    return false unless git.is_a?(String)
    git.match?(/^https?:\/\/(www\.)?github\.com\/\w+$/)
  end

def self.valid_id?(id)
    id.is_a?(Integer) && id > 0
  end

def git=(git)
    raise ArgumentError, "Неверный формат гита" unless Person.valid_git?(git)
    @git = git
  end
    
  def id=(id)
    raise ArgumentError, "Неверный формат ID" unless Person.valid_id?(id)
    @id = id
  end

# Абстрактный метод
  def validate?
    contact_present? && git_present?
  end

def contact_present?
  raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
end

def git_present?
  !@git.nil? && !@git.empty?
end

def contact    
      raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
    end

  def full_name_initials
    raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
  end

end

