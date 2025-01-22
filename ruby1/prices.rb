def ves(prices)
 summa = 0
 prices.each do |prices|
 summa += prices
 end
 summa
end

def vozrat_deneg(prices)
 summa = 0
 prices.each do |prices|
 summa -= prices
 end
 summa
end

def umenshit_cenu(prices)
 prices.each do |prices|
 summa_um = prices / 3.0
 puts format("Ваша скидка: $%.2f", summa_um)
 end
end

prices = [3.99, 25.00, 8.99]

puts format("%.2f", ves(prices))
puts format("%.2f", vozrat_deneg(prices))
umenshit_cenu(prices)