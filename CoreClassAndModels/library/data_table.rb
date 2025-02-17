class DataTable
 private attr_reader :data
  
  def initialize(data)
    self.data = data
  end

  private def data=(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Данные должны быть двумерным массивом"
    end
    @data = data
  end

  def get_element(row, column)
    raise IndexError, "Неверный номер строки" if row < 0 || row >= row_count
    raise IndexError, "Неверный номер столбца" if column < 0 || column >= column_count
    data[row][column]
  end

  def row_count
    @data.size
  end

  def column_count
    @data[0].size
  end

end
