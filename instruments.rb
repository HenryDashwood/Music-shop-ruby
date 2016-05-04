class Instruments

  attr_accessor :name, :price, :stock

  def initialize(name, price, stock)

    @name = name
    @price = price
    @stock = stock

  end



 def add(quantity)
  @stock += quantity
 end

 def reduce(quantity)
  @stock -= quantity
 end




end