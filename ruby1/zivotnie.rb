class Zivotnie
  attr_reader :name, :age

  def name=(value)
    raise "Имя не может быть пустым!" if value == ""
    @name = value
  end

  def age=(value)
    raise "Возраст #{value} недействителен!" if value < 0
    @age = value
  end

  def zvuk
    puts "#{@name} говорит гав-гав"
  end

  def mesto(bezit)
    puts "#{@name} бежит к #{bezit}"
  end

  def vozrast
    puts "#{@name}, сейчас #{@age} лет"
  end
end

class Dog < Zivotnie
  def to_s
 "#{@name} это собака , ему сейчас #{age}"
   end
  def zvuk
   super
    puts "Я укушу тебя!"
   end

end



class ZolotayaRibka < Zivotnie
  def zvuk
    puts "Я исполню 3 твоих желания"
  end

  def mesto(n)
    puts "Отпусти меня, #{n}"
  end
end

class Tigr < Zivotnie
  def tigr_name
    self.name = "Абузик"
  end

  def zvuk
    puts "#{@name} говорит р-р-р"
  end

  def mesto(n)
    puts "#{@name} живет в джунглях #{n}"
  end

  def tigr_age
    self.age = 7
  end
end

class MyClass
  def metod_zapis=(new_value)
    @metod_zapis = new_value
  end

  def metod_zapis
    @metod_zapis
  end
end

# Тестирование методов
dog = Dog.new
dog.name = "Рекс"
dog.age = 5
puts dog

puts "\nТестирование методов:"
puts "Метод to_s: #{dog.to_s}"                             # Преобразует объект в строку
puts "Метод inspect: #{dog.inspect}"                       # Строковое представление для отладки
puts "Метод class: #{dog.class}"                           # Возвращает класс объекта
puts "Метод methods: #{dog.methods.sort}"                  # Список методов объекта
puts "Метод instance_variables: #{dog.instance_variables}" # Список переменных экземпляра

dog.mesto("хозяину")
# Тестирование
noviy = MyClass.new
noviy.metod_zapis = "А вот и первый геттер и сеттер"
puts noviy.metod_zapis

zolotaya_ribka = ZolotayaRibka.new
zolotaya_ribka.name = "Золотая рыбка"
zolotaya_ribka.zvuk
zolotaya_ribka.mesto("Олег")

tigr = Tigr.new
tigr.tigr_name
tigr.zvuk
tigr.mesto("Амазона")
tigr.tigr_age
tigr.vozrast
