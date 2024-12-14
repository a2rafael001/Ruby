def pedal_gaza
	puts "нажимая на газ"
	puts "ускоряемся"
end

def zvuk_signal
	puts "Нажимаем на кнопку сигнала"
	puts "биии-биип"
end

def fari (yarkost)
	puts "Включаем фары с яркостью #{yarkost}"
    puts "Остерегайтесь оленей!"
end

pedal_gaza
zvuk_signal
fari ("дальный свет")

def probeg (proydeniy_mil,isp_topliva)
	return proydeniy_mil/isp_topliva
end

probeg_puti=probeg(400,12)
puts "Ваш  галлон в этой поездке составил #{probeg_puti} мили "

obshiy_probeg=probeg(114135,349)
puts "Ваш автомобиль в среднем расходует #{obshiy_probeg} миль на галлон"