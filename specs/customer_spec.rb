require('minitest/autorun')
require ('pry-byebug')
require('minitest/rg')
require_relative('../customer')
require_relative('../shop')
require_relative('../instruments')


class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new('Henry', 2000 ) 
    @customer2 = Customer.new('Wojtek', 1500 )
    guitar = Instruments.new('guitar', 400, 50)
    piano = Instruments.new('piano', 1000, 20)
    drums = Instruments.new('drums', 800, 15)

    guitar1 = Instruments.new('guitar', 400, 0)
    piano1 = Instruments.new('piano', 1000, 20)
    drums1 = Instruments.new('drums', 800, 15)
    @shop1 = Shop.new([guitar1, piano1, drums1], 10000)
    @shop = Shop.new([guitar, piano, drums], 10000)
  end

  def test_buy
    # binding.pry
    @customer1.buy(@shop , ["guitar", "guitar"])
    assert_equal(1200, @customer1.money)
  end

  def test_add_item_to_array
    @customer1.buy(@shop , ["guitar", "guitar"])
    assert_equal(["guitar","guitar"], @customer1.stock)
  end

  def test_shop_add_money
    @customer1.buy(@shop ,["guitar", "guitar"])
    assert_equal(10800, @shop.bank)
  end

  def test_shop_reduce_stock
    @customer1.buy(@shop ,["guitar", "guitar"] )
    assert_equal(48, @shop.stock[0].stock)
  end

  def test_out_of_stock
    test = @customer1.buy(@shop1 , ["guitar", "guitar"])
    assert_equal("We're sold out!", test )
  end

  end
