class Shop

  attr_accessor :stock, :bank

  def initialize(stock, bank)
    @stock = stock
    @bank = bank
  end

  def add_to_stock(instrument_search, quantity)
    for instrument in @stock

     if instrument.name == instrument_search
       instrument.add(quantity)
     end
    end
  end

  def remove_from_stock(instrument_search)
   
    for name in instrument_search

      for instrument in @stock

        if instrument.name == name
          instrument.reduce(1)
        end
      end
    end
  end

  def reduce_money(cash)
    @bank -= cash
  end

  def add_money(cash)
    @bank += cash
  end

  def get_total_price(item)
    instrument_prices = []
    for name in item
      for instrument in @stock
        if instrument.name == name
          instrument_prices.push(instrument.price)
        end
      end
    end
    total_price = 0
    for price in instrument_prices
      total_price += price
    end
    return total_price
  end


  def search_stock(instrument_search)
    quantity = instrument_search.size
    for name in instrument_search
    for instrument in @stock

     if name.stock == 0
       return "We're sold out!"
      elsif name.stock > 0 && name.stock < quantity
        number = quantity - name.stock
        return " Sorry we have only #{number} left"
      else 
        return "Yes. We have that."
      end
    end
  end
  end

end