class Dog

  def dog_name
    @name= "Rex"
  end
  def zvuk
    puts "#{@name} govorit gav-gav"
  end
  def mesto( bezit)
    puts "#{@name} bezit k #{bezit}"
  end
  def dog_age
    @age = 5
  end
  def vozrast
    puts "#{@name}, seychas #{@age} let"
  end
end
class ZolotayaRibka
  def zvuk
    puts "Ya ispolnoyu 3 tvoi zelania"
  end
  def mesto(n)
    puts "Otpusti menya #{n}"
  end
end
class  Tigr
  def tigr_name
    @name= "Abuzik"
  end
  def zvuk
    puts "#{@name} govorit r-r-r"
  end
  def mesto(n)
    puts "#{@name} V jungliax #{n}  zivet"
  end
  def tigr_age
    @age =7
  end
  def vozrast
    puts "#{@name}, seychas #{@age} let"
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

noviy = MyClass.new
noviy.metod_zapis = "A vot i perviy Gettr i Settr"
puts noviy.metod_zapis

dog=Dog.new
dog.dog_name
dog.zvuk
dog.mesto("xozyainu")
dog.dog_age
dog.vozrast
zolotaya_ribka=ZolotayaRibka.new
zolotaya_ribka.zvuk
zolotaya_ribka.mesto("Oleg")
tigr=Tigr.new
tigr.tigr_name
tigr.zvuk
tigr.mesto("amazona")
tigr.tigr_age
tigr.vozrast

class Dogs
  def name=(value)
    @name=value
  end
  def name
    @name
  end
  def age=(value)
    @age=value
  end
  def age
    @age
  end
  def soobshenie
    puts "#{@name}, seychas #{age} let"
  end
end

rex =Dogs.new 
rex.name = "Rex"
rex.age = 4
morti =Dogs.new 
morti.name ="Morti"
morti.age = 9
rex.soobshenie
morti.soobshenie

class Penis
attr_accessor :name
end
name=Penis.new 
name.name ="dk"
puts name.name