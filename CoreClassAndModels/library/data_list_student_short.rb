require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList

 def get_names
  ["№","Фамилия И.О.", "GitHub", "Контакт"]
 end

 def get_objects_array(index, student_short)
   [index, student_short.full_name_initials, student_short.git, student_short.contact]
 end

end