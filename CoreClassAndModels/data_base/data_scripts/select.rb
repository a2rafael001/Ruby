require_relative '../DB_connection' 

def fetch_students
  connection = StudentsDBConection.connection 
  result = connection.exec("SELECT * FROM studentsDB;") 
 
  result.each do |row|
    puts "ID: #{row['id']}, ФИО: #{row['last_name']} #{row['first_name']} #{row['middle_name']}, Дата рождения: #{row['birth_date']}, Телефон: #{row['phone']}, Telegram: #{row['telegram']}, Email: #{row['email']}, Git: #{row['git']}"
  end
end

fetch_students