class Car
  # Шаблонный метод
  def service
    drive_to_garage
    diagnose
    refuel
    wash_car
    puts "Обслуживание завершено!\n\n"
  end

  def drive_to_garage
    puts "Машина едет в гараж"
  end

  def diagnose
    raise NotImplementedError, 'Метод diagnose должен быть реализован в дочернем классе'
  end

  def refuel
    raise NotImplementedError, 'Метод refuel должен быть реализован в дочернем классе'
  end

  def wash_car
    puts "Машина моется на автомойке"
  end
end

class Sedan < Car
  def diagnose
    puts "Проводится базовая диагностика двигателя и электроники"
  end

  def refuel
    puts "Заправка бензином АИ-95"
  end
end

class Truck < Car
  def diagnose
    puts "Проводится расширенная диагностика двигателя, подвески и тормозной системы"
  end

  def refuel
    puts "Заправка дизельным топливом"
  end
end

def client_code
  puts "Обслуживание седана:"
  sedan = Sedan.new
  sedan.service

  puts "Обслуживание грузовика:"
  truck = Truck.new
  truck.service
end

client_code
