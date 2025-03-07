require_relative 'strategy'

class JSONStrategy < Strategy
	def read(filepath)
		return [] unless File.exist?(filepath)

    	file = File.read(filepath)
    	data = JSON.parse(file, symbolize_names: true)

        data.map { |student_data| Student.new(**student_data) }
    end

    def write(filepath, data)
        serialized_data = data.map do |student|
            {
                id: student.id,
                last_name: student.last_name,
                first_name: student.first_name,
                middle_name: student.middle_name,
                git: student.git,
                birth_date: student.birth_date,
                phone: student.phone,
                email: student.email,
                telegram: student.telegram
            }
        end

    	File.open(filepath, 'w') do |file|
            file.write(JSON.pretty_generate(serialized_data))
        end
    end
end