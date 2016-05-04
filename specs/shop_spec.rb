require('minitest/autorun')
require ('pry-byebug')
require('minitest/rg')
require_relative('../instruments')
require_relative('../shop')
require_relative('../customer')


class TestShop < Minitest::Test

  def setup
    @customer1 = Customer.new('Henry', 2000 ) 
    @customer2 = Customer.new('Wojtek', 1500 )

    guitar = Instruments.new('guitar', 400, 0)
    piano = Instruments.new('piano', 1000, 20)
    drums = Instruments.new('drums', 800, 15)

    @shop = Shop.new([guitar, piano, drums], 10000)
  end


def test_add_to_stock
  @shop.add_to_stock("guitar", 1)
  assert_equal(1, @shop.stock[0].stock)
end

def test_reduce_stock
  @shop.remove_from_stock("guitar", 1)
  assert_equal(-1, @shop.stock[0].stock)
end

def test_reduce_money
  @shop.reduce_money(400)
  assert_equal(9600, @shop.bank)
end

def test_add_money
  @shop.add_money(400)
  assert_equal(10400, @shop.bank)
end

def test_get_total_price
  total = @shop.get_total_price(["guitar", "guitar"])  
  assert_equal(800, total)
end

def test_sell_item
end

def test_out_of_stock
  test = @shop.search_stock("guitar", 2)
  assert_equal("Yes. We have that.", test )
end


end