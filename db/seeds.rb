# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


all_customer_data = [
  { :name => "Daniel Mainka", :email => "dmainka@gmail.com", :password => "password",  :password_confirmation => "password", :admin => true},
  { :name => "Customer1", :email => "customer1@example.com", :password => "password",  :password_confirmation => "password", :admin => false},
  { :name => "Customer2", :email => "customer2@example.com", :password => "password",  :password_confirmation => "password", :admin => false}
]

Customer.destroy_all
all_customer_data.each do |customer_info|
  c = Customer.new
  c.name = customer_info[:name]
  c.email = customer_info[:email]
  c.password = customer_info[:password]
  c.password_confirmation = customer_info[:password_confirmation]
  c.admin = customer_info[:admin]
  c.save
end
