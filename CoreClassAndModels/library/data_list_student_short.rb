require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList
 def get_names
  ["№","Фамилия И.О.", "GitHub", "Контакт"]
 end
 def get_object_array
  raise ArgumentError, "Данные отсутствует" if data.empty?
  data.map.wich_index(1) do |object,index|
    [index,object.surname_initials,object.git,object.contact]
  end
end
end