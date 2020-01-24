require_relative("../db/sql_runner.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def find
    sql = "SELECT * FROM customers WHERE id = $1"
    value = [@id]
    result = SqlRunner.run(sql, value)
    Customer.new(result).first
  end

  def self.all()
    sql = "SELECT * FROM customers"
    result = SqlRunner.run(sql)
    return result.map{|customer| Customer.new(customer)}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films
    sql = "SELECT * FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    value = [@id]
    film_data = SqlRunner.run(sql, value)
    return film_data.map{|film| Film.new(film)}
  end

end
