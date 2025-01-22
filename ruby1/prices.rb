def ves(prices)
 summa = 0
 index = 0
 while index < prices.length
 summa += prices[index]
 index += 1
 end
 summa
end
prices = [3.99, 25.00, 8.99]
puts format("%.2f", ves(prices))

def vozrat_deneg(prices)
 summa = 0
 index = 0
 while index < prices.length
 summa -= prices[index]
 index += 1
 end
 summa
end
puts format("%.2f", vozrat_deneg(prices))

def umenshit_cenu(prices)
 index = 0
 while index < prices.length
 summa_um = prices[index] / 3.0
 puts format("Ваша скидка: $%.2f", summa_um)
 index += 1
 end
end
umenshit_cenu(prices)