class Sotrudnik
attr_reader :name
def name=(name)
	if name==" "
		raise "Поле  'имя' не должно быть пустным!" 
	end
	@name=name
end

def initialize(name ="Анонимный")
	self.name =name
end
def print_name
 	puts "Имя: #{name}"
 end

end
class ShtatnySotrudnil < Sotrudnik
	attr_accessor :zarplata
	def zarplata=(zarplata)
	if zarplata<0
		raise "Поле заработной платы к сожелению не может быть меньше нуля)"
	end
	@zarplata=zarplata
end
	def initialize(name ="Анонимный",zarplata =0.0)
	super(name)
	self.zarplata = zarplata
end
def kvintacia_o_zarplate
	print_name
	kvintacia_o_zarplate =(zarplata / 365.0 ) * 14
	format_zp =format("%0.2f",kvintacia_o_zarplate)
	puts "Выплата за этот период: $#{format_zp}"
end
end
class NayomnySotrudnik < Sotrudnik
	attr_accessor :chasobaya_oplata, :chasy_v_nedelyu
	def initialize(name ="Анонимно", chasobaya_oplata = 0.0, chasy_v_nedelyu = 0.0)
		super(name)
		self.chasobaya_oplata =chasobaya_oplata
		self.chasy_v_nedelyu =chasy_v_nedelyu
	end
	def self.oxranik(name)
		NayomnySotrudnik.new(name, 19.35, 30)
	end
	def self.kassir(name)
		NayomnySotrudnik.new(name, 15.32, 25)
	end
	def self.uborshik(name)
		NayomnySotrudnik.new(name, 11.25, 45)
	end

	def kvintacia_o_zarplate
	print_name
	period =chasobaya_oplata * chasy_v_nedelyu * 2
	format_zp =format("%0.2f",period)
	puts "Выплата за этот период: $#{format_zp}"
end
end


any = ShtatnySotrudnil.new
any.name = "Аня Хрюкина"
any.zarplata = 50000
any.kvintacia_o_zarplate
zaira =NayomnySotrudnik.new("Заирова Диана Саид-Хусейнова", 34.5, 10)
zaira.kvintacia_o_zarplate
angelina = NayomnySotrudnik.kassir("Angelina Barisovna")
eduard =NayomnySotrudnik.oxranik("Eduard Gagikovich")
teta_lyuba =NayomnySotrudnik.uborshik("Tetya Lyuba")
angelina.kvintacia_o_zarplate
eduard.kvintacia_o_zarplate
teta_lyuba.kvintacia_o_zarplate