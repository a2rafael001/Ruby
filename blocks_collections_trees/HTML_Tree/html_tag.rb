# html_tag.rb

class Tag
  attr_accessor :name, :attributes, :children, :self_closing

  # Инициализация тега: имя, атрибуты и флаг самозакрывающегося тега
  def initialize(name, attributes = {}, self_closing = false)
    @name = name
    @attributes = attributes
    @self_closing = self_closing
    @children = []  # Массив дочерних тегов
  end

  # Метод, возвращающий строковое представление тега
  def get_string
    "Tag: #{@name}"
  end

  # Метод, возвращающий число — например, количество атрибутов
  def get_number
    @attributes.size
  end

  # Метод, возвращающий булево значение — наличие дочерних элементов
  def get_boolean
    !@children.empty?
  end

  # Строковое представление тега для вывода
  def to_s
    attr_str = @attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
    if attr_str.empty?
      "<#{@name}>"
    else
      "<#{@name} #{attr_str}>"
    end
  end
end
