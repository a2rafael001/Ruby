require 'mysql2'

class StudentsDBConnection
  def self.connection
    @connection ||= Mysql2::Client.new(
      host: 'localhost',
      username: 'root',
      password: 'newpassword',
      database: 'studentsDB',
      port: 3306
    )
  end
end
