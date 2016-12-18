require 'sequel'

system('createdb', 'billing2')
db = Sequel.connect('postgres://localhost/billing2')

db.create_table :customers do
  primary_key   :id
  String        :name,          :null => false
  String        :payment_token, :unique => true, :null => false, :size => 8, :fixed => true
  constraint(:valid_payment_format) {payment_token.like(/[A-Z]{8}/)}
end

db.create_table :services do
  primary_key   :id
  String        :description, :null => false
  BigDecimal    :price,       :null => false, :size => [10, 2]
  constraint(:price_validator){ price >= 0.00 }
end

db[:customers].insert(name: 'Pat Johnson', payment_token: 'XHGOAHEQ')
db[:customers].insert(name: 'Nancy Monreal', paymet_token: 'JKWQPJKL')
db[:customers].insert(name: 'Lynn Blake', 'KLZXWEEE')
db[:customers].insert(name: 'Chen Ke-Hua', 'KWETYCVX')
db[:customers].insert(name: 'Scott Lakso', 'UUEAPQPS')
db[:customers].insert(name: 'Jim Pornot',  'XKJEYAZA')

db[:services].insert(description: 'Unix Hosting', price: 5.95)
db[:services].insert(description: 'DNS', 4.95)
db[:services].insert(description: 'Whois Registration', 1.95)
db[:services].insert(description: 'High Bandwidth', 15.00)
db[:services].insert(description: 'Business Support', 250.00)
db[:services].insert(description: 'Bulk Email', 250.00)
db[:services].insert(description: 'One-to-one Training', 999.00)

db.create_table :customers_services do
  primary_key   :id
  foreign_key   :customer_id, :customers, on_delete: :cascade
  foreign_key   :service_id, :services
end





