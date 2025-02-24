require_relative '../DB_connection' 

def fetch_students
  connection = StudentsDBConnection.connection 
  result = connection.query("SELECT * FROM students;") 
 
  result.each do |row|
    puts "ID: #{row['id']}, ФИО: #{row['last_name']} #{row['first_name']} #{row['middle_name']}, Дата рождения: #{row['birth_date']}, Телефон: #{row['phone']}, Telegram: #{row['telegram']}, Email: #{row['email']}, Git: #{row['git']}"
  end
end

fetch_students