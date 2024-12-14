def zvuk_zivotnogo(tip_ziv,name)
	if tip_ziv == "Птичка"
		puts "#{name},издает звук Чик-Чирик"
	elsif tip_ziv == "Собака"
		puts "#{name},гавкает Гав-Гав"
	elsif tip_ziv=="Кошка"
		puts "#{name}, мявкает Мяу-Мяу"
	end
end

def dvizenie(tip_ziv,name,mesto)
	if tip_ziv=="птичка"
		puts "#{name},летит в #{mesto},когда наступает холода"
	elsif tip_ziv=="собака"
		 puts "#{name},встречает #{mesto},когда приходят гости "
		elsif tip_ziv== "Кошка"
			puts "#{name}, игарется #{mesto}"
		end
	end

	def vozrast (name,age)
		puts "#{name}, сейчас #{age} лет"
	end

	zvuk_zivotnogo("Птичка","Гоша")
	dvizenie("Собака","Рекс","у входа")
	vozrast("Адель",4)