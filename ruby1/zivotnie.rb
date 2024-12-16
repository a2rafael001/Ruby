class Dog
  def zvuk
    puts "gav-gav"
  end
  def mesto(n)
    puts " begu k #{n}"
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
  def zvuk
    puts "rrr"
  end
  def mesto(n)
    puts "V jungliax #{n} ya zivu"
  end
end

dog=Dog.new
zolotaya_ribka=ZolotayaRibka.new
tigr=Tigr.new

dog.zvuk
dog.mesto("xozyainu")
zolotaya_ribka.zvuk
zolotaya_ribka.mesto("Oleg")
tigr.zvuk
tigr.mesto("amazona")