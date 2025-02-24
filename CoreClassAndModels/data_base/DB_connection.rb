require 'mysql2'

begin
  client = Mysql2::Client.new(
    host: 'localhost',
    username: 'root',
    password: 'newpassword', # Замените на ваш пароль
    database: 'studentsdb'
  )
  puts "Connected to database: #{client.query('SELECT DATABASE()').first['DATABASE()']}"
rescue Mysql2::Error => e
  puts "Error: #{e.message}"
end