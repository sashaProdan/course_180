require "sequel"

db = Sequel.connect('postgres://localhost/sequel_single_table')

def monetary_format(number)
  sprintf("$%0.2f", number)
end

result = db[:menu_items].select do
  labor_calc = 12 / 60.00 / prep_time
  profit_calc = menu_price - labor_calc - ingredient_cost
  [item, menu_price, ingredient_cost, labor_calc.as(labor), profit_calc.as(profit)]
end

result.each do |row|
  puts row[:item]
  puts "menu_price: #{monetary_format(row[:menu_price])}"
  puts "ingredient cost: #{monetary_format(row[:ingredient_cost])}"
  puts "labor: #{monetary_format(row[:labor])}"
  puts "profit: #{monetary_format(row[:profit])}"
  puts
end