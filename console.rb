require_relative('models/films.rb')
require_relative('models/customers.rb')
require_relative('models/tickets.rb')

require('pry')

Ticket.delete_all
Customer.delete_all
Film.delete_all


customer1 = Customer.new(
  'name' => 'Harley',
  'funds' => '10.00')
customer1.save

customer2 = Customer.new(
  'name' => 'Marion',
  'funds' => '20.00')
  customer2.save

customer3 = Customer.new(
  'name' => 'Izzy',
  'funds' => '15.00')
  customer3.save

customer4 = Customer.new(
  'name' => 'Sarah',
  'funds' => '10')
  customer4.save

film1 = Film.new(
  'title' => 'Uncut Gems',
  'price' => '8.50')
  film1.save

film2 = Film.new(
  'title' => 'Little Women',
  'price' => '8.50')
  film2.save

film3 = Film.new(
  'title' => 'Parasite',
  'price' => '8.50')
  film3.save

ticket1 = Ticket.new(
  'customer_id' => customer1.id,
  'film_id' => film2.id)
  ticket1.save

ticket2 = Ticket.new(
  'customer_id' => customer4.id,
  'film_id' => film2.id)
  ticket2.save

ticket3 = Ticket.new(
  'customer_id' => customer2.id,
  'film_id' => film3.id)
  ticket3.save

ticket4 = Ticket.new(
  'customer_id' => customer3.id,
  'film_id' => film1.id)
  ticket4.save



binding.pry
nil
