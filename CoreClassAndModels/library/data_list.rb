class DataList  
  private attr_reader :data, :column_names 
  private attr_accessor :selected
  
  def initialize(data,column_names=[])
    self.data = data
    self.column_names=column_names
    @selected = []
  end

  def set_date(new_data)
    raise ArgumentError, "Объект должен являться массивом" unless new_data.is_a?(Array)
    self.data = new_data
  end

  def select(number)
    raise ArgumentError, "Индекс выходит за пределы" unless number.between?(0, data.length - 1)
    selected << number
  end

  def get_selected
    selected
  end

  def build_table
    [get_columns] + get_data
  end

  def get_columns
    columns_names
  end

  def get_data
    gat_object_array
  end

def size
  @date.size
end

  private

  def data=(data)
    raise ArgumentError, "Объект должен являться массивом" unless data.is_a?(Array)
    @data = data
  end

  def column_names=(names)
    raise ArgumentError, "Наименования столбцов не могут быть изменены" unless @column_names.nil?
    @columns_names = names
  end

  def get_object_array
    raise NotImplementedError, 'Метод реализован в дочерном классе.'
  end

end