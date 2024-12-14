#приветствую в мою игру 
#запрашиваю имя
puts "Добро пожаловать в мою игру 'Угадай цифру' "
print "Как тебя зовут? "

name=gets.chomp

puts "Приветствую, #{name}!"
loop do
# Сохранение случайного числа.
puts "У меня есть случайное число от 1 до 100."
puts "Сможешь его угадать?"
target = rand(100) + 1
#счетчик отслеживания  введенных попыток
num_count=0
#признак продолжения игры
guess_it= false

until num_count == 10 || guess_it
puts "У тебя осталось #{10 - num_count} попыток."

puts "Угадай"

guess= gets.to_i
num_count +=1

 # Сравнение введенного числа с загаданным
 # и вывод соответствующего сообщения.
 if guess < target
 puts "ваше число меньше загаданного,попробуйте написать число побольше."
 elsif guess > target
 puts "ваше число больше  загаданного,попробуйте написать число меньше."
 elsif guess == target
 puts "Красава, #{name}!"
 puts "Ты угадал моё число за #{num_count} попыток."
 guess_it = true
 end
end

# Если попыток не осталось, сообщить загаданное число.
unless guess_it
 puts "Ты не угадал моё число.(Это было #{target}.)"
end

puts "Хочешь сыграть ещё раз? Введи 'yes' или 'no':"
  play_again = gets.chomp.strip.downcase
  puts "#{play_again}"
break unless play_again == "yes"

end

puts "Спасибо за игру! До встречи!"