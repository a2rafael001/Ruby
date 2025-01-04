class Avto
	attr_accessor :spidometr, :rasxod
    def probeg
        @spidometr/@rasxod
    end
    def uskorenie
        puts "Жми на газ!"
    end
    def zvuk_signal
        puts "Бии-БиииП"
    end 
    def upravlenie_ruliem
	     puts "Поверните передние 2 колеса, для поворота"
    end
end
class Car < Avto

end

class Trackt < Avto
	attr_accessor :gruz
	def gruz_platforma(tovar)
		puts "Закрепляем #{tovar} в кузове грузовика."
		@gruz=tovar
	end


end

class Moto < Avto
    def upravlenie_ruliem
         puts "Поверните переднее колесо."
    end
    
end


truck = Trackt.new
truck.gruz_platforma("259 футбольных мячей")
puts "Этот грузовик перевозит #{truck.gruz}."
truck.uskorenie
truck.upravlenie_ruliem
car = Car.new
car.spidometr = 11432
car.rasxod = 366
puts car.instance_variables
puts "Средний расход топлива за всё время:"
puts car.probeg
mot = Moto.new
mot.upravlenie_ruliem


