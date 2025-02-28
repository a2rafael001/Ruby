require 'mysql2'

class StudentsDBConnection
  DEFAULT = {
    host: 'localhost',
    username: 'root',  
    password: 'newpassword',    
    database: 'studentsdb',
    port: 3306          
  }.freeze

  @instance = nil
  private_class_method :new
  private attr_reader :client

  def self.instance
    @instance ||= new
  end

  def initialize
    @client = Mysql2::Client.new(DEFAULT)
  end

  def execute_query(query, params = [])
    statement = @client.prepare(query)
    statement.execute(*params)
  end
  
  def close
    @client.close
  end
end
