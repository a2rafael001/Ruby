# Принятие имени пользователя из аргументов программы
name = ARGV[0]

# Проверяю, было ли передано имя
if name.nil? || name.empty?
  puts "Пожалуйста, передайте имя пользователя как аргумент."
  exit
end

# Приветствие пользователя с форматированием строки
puts "Привет, #{name}!"



# Спрашиваем у пользователя, какой у него любимый язык программирования
puts "Какой у тебя любимый язык программирования?"

# Использую STDIN.gets для чтения ввода с клавиатуры
favorite_language = STDIN.gets.chomp.downcase

# Анализирую ответ пользователя
if favorite_language == "ruby"
  puts "Ах ты, подлиза! :)"
else
  puts "Ничего, скоро тебе понравится Ruby!"

  # Комментарии для разных языков
  case favorite_language
  when "python"
    puts "# В Python используются комментарии с решеткой."
  when "c++"
    puts "// В C++ комментарии начинаются с двух косых черт."
  when "java"
    puts "// В Java комментарии тоже начинаются с двух косых черт."
  when "javascript"
    puts "// В JavaScript используются такие же комментарии, как и в C++ и Java."
  else
    puts "# В любом случае, Ruby — это отличный выбор! :)"
  end
end
