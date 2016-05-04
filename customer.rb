require_relative('shop')


class Customer

attr_accessor :name, :money, :stock


  def initialize(name, money)
    @name = name
    @money = money
    @stock = []
  end

  def buy(shop, item)
    
    quantity = item.size
    # return shop.search_stock(item)
    total_price = shop.get_total_price(item)
    @money -= total_price

    @stock = item

    shop.add_money( total_price )

    shop.remove_from_stock( item )
  end



end